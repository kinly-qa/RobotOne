from robot.api.deco import library, keyword
from robot.libraries.BuiltIn import BuiltIn


@library
class Shop:
    def __init__(self):
        self.seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')

    @keyword
    def hello_world(self):
        print("Hello World!")

    @keyword
    def add_items_to_cart_and_checkout(self, product_list):

        i = 1

        products_titles = self.seleniumlib.get_webelements("css:.card-title")

        # for products_title in products_titles:
        #     if products_title.text in product_list:
        #        self.seleniumlib.click_button(
        #            "xpath:(//*[@class='card-footer'])["+str(i)+"]/button")
        #    i = i+1
