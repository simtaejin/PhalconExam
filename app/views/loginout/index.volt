{% set numbers = ['one': 1, 'two': 2, 'three': 3] %}

{{ dump(numbers) }}<br/>

{% for name, value in numbers %}
Name: {{ name }} Value: {{ value }}<br/>
{% endfor %}

{{ dispatcher.getControllerName() }}<br/>
{{ dispatcher.getActionName() }}<br/>
=======================================<br/>
{{ router.getControllerName() }}<br/>
{{ router.getActionName() }}<br/>