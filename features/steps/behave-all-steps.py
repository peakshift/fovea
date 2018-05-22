from behave import * 
import json
import requests
import validate



@given(u'the database contains')
def step_impl(context):
    #instance of database
	

@given(u'I have authorisation')
def step_impl(context):
    #logged in as admin
	

@given(u'the system knows about the database')
def step_impl(context);
    #connection has started and is accessible


@when(u'a "POST" request is made to "{resource}" with the body')
def step_impl(context, resource):
    post_data = context.text
    context.response = requests.post("" + resource, data = post_data)
	


@then(u'the response status code is "{code}" is')
def step_impl(context, code):
    assert int(code) == int(context.response.status_code)



@when(u'a "GET" request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.get("" + resource)

	

@when(u'a "PUT" request is made to "{resource}" with the body')
def step_impl(context, resource):
	put_data = context.text
    context.response = requests.put("" + resource, data = put_data)
		


@when(u'a "DELETE" request is made to "{resource}"')
def step_impl(context, resource):
	context.response = requests.delete("" + resource)
	


@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
    print context.response.headers[header]

	

@then(u'the response body is')
def step_impl(context):
    sc_dict = json.loads(context.text)
    rs_dict = json.loads(context.response.text)

    assert  sc_dict == rs_dict


def step_impl(context):
    data = json.loads(context.text)
    assert validate.Validate(data)


@when(u'data with a missing field is passed to Validator')
def step_impl(context):
    data = json.loads(context.text)
    assert validate.Validate(data)

@when(u'a field with an invalid datatype is passed to Validator')
def step_impl(context):
    data = json.loads(context.text)
    assert  validate.Validate(data)


@when(u'no data is passed to Validator')
def step_impl(context):
    data = json.loads(context.text)
    assert validate.Validate(data)


@then(u'validation "{results}"')
def step_impl(context, results):
    print "Validation %r" % results












