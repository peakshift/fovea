from behave import * 
import json
import requests



url = "http://localhost:3000"

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
    assert context.response.text == context.text
    #context.assertContains(context.response.text, context.text)

 
'''
@given(u'the database contains')
def step_impl(context):
	


@given(u'I have authorisation')
def step_impl(context):
	

@given(u'the system knows about the database')
def step_impl(context);


@when(u'a POST request is made to "{resource}" with the body')
def step_impl(context, resource):
	r = requests.post("")
	


@then(u'the response status code is "{code}" is')
def step_impl(context, code):
	print r.status_code
	


@when(u'a GET request is made to "{resource}"')
def step_impl(context, resource):
	r = requests.get("")

	

@when(u'a PUT request is made to "{resource}" with the body')
def step_impl(context, resource):
	r = requests.put("")
	


@when(u'a GET request is made to "{resource}"/"{endpoint}"')
def step_impl(context, resource, endpoint):
	r = requests.get("")
	


@when(u'a PUT request is made to "{resource}"/"{endpoint}" with the body')
def step_impl(context, resource, endpoint):
	r = requests.put("")
	


@when(u'a DELETE request is made to "{resource}"/"{endpoint}"')
def step_impl(context, resource, endpoint):
	r = requests.delete("")
	


@when(u'a GET request is made to "{resource}"/"{id}"/"{endpoint}"')
def step_impl(context, resource, id, endpoint):
	r = requests.gett("")
	


@when(u'a PUT request is made to "{resource}"/"{id}"/"{endpoint}" with the body')
def step_impl(context, resource, id, endpoint):
	r = requests.put("")
	


@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
	r.headers.get({'header': 'value'})

	

@then(u'the response body is')
def step_impl(context):
	print r.json()
	
'''













