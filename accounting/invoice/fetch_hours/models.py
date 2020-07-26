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
