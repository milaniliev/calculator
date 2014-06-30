# Make every String have a .toNumber() method
String.prototype.toNumber = ->
	Number.parseFloat(this)

class Calculator
	@digits = [0,1,2,3,4,5,6,7,8,9, '.']

	@operators = ['+', '-', '*', '/']

	constructor: (element) ->
		this.element = element
		this.leftOperandDisplay = this.element.querySelector('.display#left-operand')
		this.rightOperandDisplay = this.element.querySelector('.display#right-operand')

		this.resultDisplay = this.element.querySelector('.display#result')

		this.currentOperandDisplay = this.leftOperandDisplay

		this.build_buttons()

	build_buttons: ->
		this.constructor.digits.forEach (number) =>
			this.addButton(new DigitButton(number))

		this.constructor.operators.forEach (operator) =>
			this.addButton(new OperatorButton(operator))

		this.addButton(new EqualsButton)


	addButton: (button) ->
		this.element.querySelector('buttons').appendChild(button.element)

	addDigitToCurrentOperand: (digit) ->
		this.currentOperandDisplay.value = "#{this.currentOperandDisplay.value}#{digit}"

	setOperator: (operator) ->
		this.currentOperator = operator
		this.currentOperandDisplay = this.rightOperandDisplay

	performOperation: ->
		switch this.currentOperator
			when '+'
				value = this.leftOperandDisplay.value.toNumber() + this.rightOperandDisplay.value.toNumber()
			when '-'
				value = this.leftOperandDisplay.value.toNumber() - this.rightOperandDisplay.value.toNumber()
			when '*'
				value = this.leftOperandDisplay.value.toNumber() * this.rightOperandDisplay.value.toNumber()
			when '/'
				value = this.leftOperandDisplay.value.toNumber() / this.rightOperandDisplay.value.toNumber()

		this.currentOperandDisplay = this.leftOperandDisplay
		this.resultDisplay.value   = value


class Button
	constructor: (text) ->
		this.element = document.createElement('button')
		this.element.textContent = text
		this.element.addEventListener 'click', => this.action()

class DigitButton extends Button
	constructor: (digit) ->
		this.digit = digit
		super(digit)

	action: ->
		window.calculator.addDigitToCurrentOperand(this.digit)


class OperatorButton extends Button
	constructor: (operator) ->
		this.operator = operator
		super(operator)

	action: ->
		window.calculator.setOperator(this.operator)


class EqualsButton extends Button
	constructor: ->
		super('=')

	action: ->
		window.calculator.performOperation()


window.calculator = new Calculator document.querySelector('calculator')
