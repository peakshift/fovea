from behave import *
from tinydb import TinyDB, Query 
import json
import requests
import common.validate as validation

validate = validation.Validate()
# db = TinyDB('db.json')
url = "http://localhost:5000"



@when(u'a "POST" request is made to "{resource}" with the body')
def step_impl(context, resource):
	post_data = json.loads(context.text)
	context.response = requests.post(url + resource, data = post_data)



@then(u'the response status code is "{code}"')
def step_impl(context, code):
	assert int(code) == int(context.response.status_code)

@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
	assert (context.response.headers[header] == value)


@then(u'the response body is')
def step_impl(context):

	sc_dict = json.loads(context.text)
	rs_dict = json.loads(context.response.text)

	assert  sc_dict == rs_dict

@given(u'a "POST" request is made with the body')
def step_impl(context):
	context.data = json.loads(context.text)

@when(u'it is passed to Validator')
def step_impl(context):
	context.response = validate.check(context.data)

@then(u'validation returns "{results}"')
def step_impl(context, results):
	assert str(context.response) == results