class Calculator
	@digits = [0,1,2,3,4,5,6,7,8,9]

	@operators = ['+', '-', '=']

	constructor: (element) ->
		this.element = element

		this.build_buttons()

	build_buttons: ->
		this.constructor.digits.forEach (number) =>
			this.addButton(new DigitButton(number))

		this.operators




	addButton: (button) ->
		this.element.querySelector('buttons').appendChild(button.element)


class Button
	constructor: (text) ->
		this.element = document.createElement('button')
		this.element.textContent = text
		this.element.addEventListener 'click', => this.action()

class DigitButton extends Button
	action: ->
		window.calculator.addDgitToCurrentOperant(this.digit)



window.calculator = new Calculator document.querySelector('calculator')
