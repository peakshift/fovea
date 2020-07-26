import json
import os
import requests


API_KEY = os.environ['HARVEST_API_KEY']
ACCOUNT_ID = os.environ['HARVEST_ACCOUNT_ID']

endpoint = "https://api.harvestapp.com/v2/time_entries"
headers = {
    "Authorization": "Bearer {}".format(API_KEY),
    "Harvest-Account-Id": "{}".format(ACCOUNT_ID)
}

def refine(dict_):
    return {
        'project': dict_['project']['name'],
        'client': dict_['client']['name'],
        'client_currency': dict_['client']['currency'],
        'task': dict_['task']['name'],
        'notes': dict_['notes'],
        'started_time': dict_['started_time'],
        'ended_time': dict_['ended_time'],
        'hours': dict_['hours'],
        'rounded_hours': dict_['rounded_hours'],
        'spent_date': dict_['spent_date'],
    }

def aggregate(refined):
    agg = {}
    for i in refined:
        project = i['project']
        if not agg.get(project):
            agg[project] = {'client': i['client'], 'hours': 0, 'notes': {}}
        notes = agg[project]['notes']

        i_note = i['notes']
        if not notes.get(i_note):
            notes[i_note] = {'hours': 0, 'count': 0}

        agg[project]['hours'] += i['hours']
        notes[i_note]['hours'] += i['hours']
        notes[i_note]['count'] += 1

    return agg

def run(params):
    resp = requests.get(endpoint, params=params, headers=headers)
    total_pages = int(resp.json()['total_pages'])
    total_entries = int(resp.json()['total_entries'])

    resps = {} 
    for i in range(1, total_pages + 1): 
        params['page'] = i 
        resps[i] = requests.get(endpoint, params=params, headers=headers) 

    resps_text = {k: v.json() for k, v in resps.items()}
    entries_all = [item for val in resps_text.values() for item in val['time_entries']]
    refined = [refine(d) for d in entries_all]

    report = aggregate(refined)

    return report

if __name__ == "__main__":
    params = {
        "from": "20200229",
        "to":"20200328"
    }

    aggregated = run(params)
    with open('dump.json', 'w') as f: 
        f.write(json.dumps(aggregated, indent=4))
