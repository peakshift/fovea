from behave import * 
import json
import requests
import common.validate as validation

validate = validation.Validate()
#url = "http://localhost:3000"

'''
@given(u'the database contains')
def step_impl(context):
	#instance of database
	pass

@given(u'the system knows about the database')
def step_impl(context):
	pass
		

@when(u'a "GET" request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.get(url + resource)

@when(u'a "DELETE" request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.delete(url + resource)


@when(u'a "POST" request is made to "{resource}" with the body')
def step_impl(context, resource):
	post_data = context.text
	context.response = requests.post(url + resource, data = post_data)


@when(u'a "PUT" request is made to "{resource}" with the body')
def step_impl(context, resource):
	put_data = context.text
	context.response = requests.put(url + resource, data = put_data)


@then(u'the response status code is "{code}"')
def step_impl(context, code):
	assert int(code) == int(context.response.status_code)

@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
	print (context.response.headers[header])


@then(u'the response body is')
def step_impl(context):

	sc_dict = json.loads(context.text)
	rs_dict = json.loads(context.response.text)

	assert  sc_dict == rs_dict
'''
@given(u'a "POST" request is made with the body')
def step_impl(context):
	context.data = json.loads(context.text)

@when(u'it is passed to Validator')
def step_impl(context):
	context.response = validate.check(context.data)

@then(u'validation returns "{results}"')
def step_impl(context, results):
	assert str(context.response) == results