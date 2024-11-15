class Hello:
    def __init__(self, name):
        self.name = name
    def say_hello(self):
        print(f"Hello, {self.name}!")

def main():
    h = Hello("world")
    h.say_hello()

if __name__ == "__main__":
    main()

