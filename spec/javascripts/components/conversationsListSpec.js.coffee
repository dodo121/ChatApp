#= require application
#= require components

TestUtils = React.addons.TestUtils

describe 'test', =>
  it 'lorem', =>
    console.log @ConversationsList
    list = TestUtils.renderIntoDocument(@ConversationsList)
    console.log(list)
#    expect(TestUtils.isElement(list)).toBe(true)
#    ul = TestUtils.findRenderedDOMComponentWithTag(list, 'ul')
#    console.log(ul.getDOMNode())
#    expect(list)