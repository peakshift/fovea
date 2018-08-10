from behave import *
import json
import requests
import common.validate as validation


validate = validation.Validate()
url = "http://localhost:5000"


# Create project
@when(u'a "POST" request is made to "{resource}" with the body')
def step_impl(context, resource):
    post_data = json.loads(context.text)
    context.response = requests.post(url + resource, json=post_data)


@then(u'the response status code is "{code}"')
def step_impl(context, code):
    print(context.response.status_code)
    assert int(code) == int(context.response.status_code)


@then(u'the "{header}" header value is "{value}"')
def step_impl(context, header, value):
    assert (context.response.headers[header] == value)


@then(u'the response body is')
def step_impl(context):
    sc_dict = json.loads(context.text)
    rs_dict = json.loads(context.response.text)

    assert sc_dict == rs_dict


# Validation Steps
@given(u'a "POST" request is made with the body')
def step_impl(context):
    context.data = json.loads(context.text)


@when(u'it is passed to Validator')
def step_impl(context):
    context.response = validate.check(context.data)


@then(u'validation passes')
def step_impl(context):
    assert context.response is True


@then(u'validation fails')
def step_impl(context):
    assert context.response is False
