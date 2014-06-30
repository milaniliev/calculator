run: build
	open calculator.html

build: calculator.js calculator.css

calculator.js: src/calculator.coffee
	coffee --compile --stdio < src/calculator.coffee > calculator.js

calculator.css: src/calculator.styl
	stylus < src/calculator.styl > calculator.css
