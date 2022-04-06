from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.selenium_library = BuiltIn().get_library_instance("SeleniumLibrary")

    @keyword
    def hello_world(self):
        print("Hello World!")

    @keyword
    def add_items_to_cart_and_checkout(self, product_list):
        self.selenium_library.get_webelements()
