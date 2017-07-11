# Account Overview test cases
user_id = 'ccdata1'
answer = 'test'
password = 'sov12345'
account1 = ''
account2 = ''
from_date = ''
to_date = ''
DICT__login_data = {'user': 'rob', 'answer': 'test', 'password': 'sov12345'}
DICT__Account_Overview = {'user': 'ccdata1', 'answer': 'test', 'password': 'sov12345', 'account1': '*5389'}

DICT__Overview_Account_Details = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602'}

DICT__Filtering_Option_All = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602',
                              'from_date': '20170401', 'to_date': '20170425'}

DICT__Filtering_Option_IN = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602',
                             'from_date': '20170401', 'to_date': '20170425'}

DICT__Filtering_Option_OUT = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602',
                              'from_date': '20170401', 'to_date': '20170425'}

DICT__I_Want_To_options = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602'}

DICT__Credit_Card_Overview_Account_Details = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd',
                                              'account': '*2331'}

DICT__Credit_Card_Filtering_Option_All = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd',
                                          'account': '*2331', 'from_date': '3/13/2017', 'to_date': '4/14/2017'}

DICT__Credit_Card_Filtering_Option_IN = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd',
                                         'account': '*2331', 'from_date': '3/13/2017', 'to_date': '4/14/2017'}

DICT__Credit_Card_Filtering_Option_OUT = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd',
                                          'account': '*2331', 'from_date': '3/13/2017', 'to_date': '4/14/2017'}

################################################################################################################################################################################
# CONTACT US
DICT__Contact_Us = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}

# PAPERLESS
DICT__Go_Paperless_All = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}
DICT__Go_Paperless_Any = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account': '*4602'}
DICT__Go_Paperless_Some = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd', 'account1': '*4602',
                           'account2': '*7274'}

DICT__Help = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}
DICT__Locations = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}
DICT__Online_Banking_Agreement = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}
DICT__Privacy_Policy = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}
DICT__Terms_Of_Use = {'user': 'lcorobm64', 'answer': 'test', 'password': '1234abcd'}


def get_variables(**args):
    total_arg = len(args.keys())
    variables = {'': ''}
    i = 0
    arg_string = ''
    for key in args:
        i = i + 1
        if i < total_arg:
            arg_string = arg_string + chr(39) + key + chr(39) + ':' + chr(39) + args[key] + chr(39) + ','
        else:
            arg_string = arg_string + chr(39) + key + chr(39) + ':' + chr(39) + args[key] + chr(39)

    # arg_string = arg_string + '}'
    variables = arg_string
    return dict(variables)
    # variables = {'argument 1': arg1,
    #              'answer': arg2,
    #              'password': arg3
    #              }
    # return variables
