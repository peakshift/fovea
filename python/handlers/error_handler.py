def error_msg(errorLog):
    """
    Takes in a jsonschema.exception.ValidationError log message, splits it into
     a list by each new line and returns the specific shortened message to users
     of what the error is.
    :param errorLog (exception): the full log message
    :return error(dict) : the specific error that occurred
    """
    errorList = [line for line in str(errorLog).split('\n')]
    errorMsg = "Invalid request. " + errorList[0]
    error = {
        "msg": errorMsg
    }

    return error
