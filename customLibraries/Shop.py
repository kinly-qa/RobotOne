from robot.api.deco import library,keyword

@library
class Shop:

    @keyword
    def hello_world(self):
        print("Hello World")

    @keyword
    def add_items_to_cart_and_checkout(self,product_list):
        pass
