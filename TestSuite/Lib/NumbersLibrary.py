# from  appscript  import *
#  Numbers = app('Numbers')
#  current_table = None
#  for sheet in Numbers.documents.first.sheets():
#       for table in sheet.tables():
#            if table.selection_range():
#                 current_table = table
#
#  if current_table:
#       for cell in current_table.cells():
#            cell.value.set('')
#
#       current_table.selection_range.set(to=current_table.ranges[u'A1'])
