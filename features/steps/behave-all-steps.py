from behave import * 
import json
import requests



@when('a "GET" request is made to "{resource}"')
def step_impl(context, resource):
    context.response = requests.get(url + resource)

    

@then('the response status code is "{code}"')
def step_impl(context, code):
    assert int(code) == int(context.response.status_code)

@then('the "{header}" header value is "{value}"')
def step_impl(context, header, value):
    print context.response.headers[header]


@then('the response body is')
def step_impl(context):
    print type(context.text) #behave.model.Text
    print type(context.response.text) #unicode

    print type(json.loads(context.text)) #dict
    print type(json.loads(context.response.text)) #dict

    sc_dict = json.loads(context.text)
    rs_dict = json.loads(context.response.text)

    print sc_dict['name'] #Blossom
    print rs_dict['name'] #Blossom

    assert  sc_dict == rs_dict


 
'''
@given(u'the database contains')
def step_impl(context):
	


@given(u'I have authorisation')
def step_impl(context):
	

@given(u'the system knows about the database')
def step_impl(context);


@when(u'a POST request is made to "{resource}" with the body')
def step_impl(context, resource):
	context.response = requests.post("" + resource)
	


@then(u'the response status code is "{code}" is')
def step_impl(context, code):
    assert int(code) == int(context.response.status_code)



@when(u'a GET request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.get("" + resource)

	

@when(u'a PUT request is made to "{resource}" with the body')
def step_impl(context, resource):
	context.response = requests.put("" + resource)
		


@when(u'a DELETE request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.delete("" + resource)
	


@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
    print context.response.headers[header]

	

@then(u'the response body is')
def step_impl(context):
	print context.response.text.json()
	
'''













