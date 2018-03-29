import re
class MyLibrary:
    ROBOT_LIBRARY_SCOPE = 'GLOBAL'

    def join_two_strings(self, arg1, arg2):
        join = arg1 + " " + arg2
        return join

    def join_two_strings_with_plus(self, arg1, arg2):
        join = arg1 + "+" + arg2
        return join

    # Expected pattern: "{type} {scalar}={value}{unit}, {scalar}={value}{unit}, ..."
    def calculate_expected_physics_value(self, query):
        split = query.partition(" ")
        physics_calculations = {
            'work': self.calculate_work(split[2])
        }
        return physics_calculations.get(split[0], 'Type of calculation undefined')

    # Expects: "F={newtons}N, d={meters}m"
    def calculate_work(self, input):
        values = re.findall(r"\d*\.\d+|\d+", input)
        print (values)
        # W = F * d (in kJ)
        return str((float(values[0]) * float(values[1])) / 1000) + ' kJ'
