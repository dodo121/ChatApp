#= require spec_helper

conversation = [
  { id: 4, users_names: ["ardith_volkman@example.com"], newMessagesCount: 8 }
]

describe 'ConversationDetails', =>
  it 'is a react element', ->
    testedElement = React.createElement(@ConversationDetails)
    expect(TestUtils.isElement(testedElement)).toBe(true)

  it 'includes provided props.cssClassName', =>
    className = 'testing-class-name'
    testedElement = React.createElement(
      @ConversationDetails, conversation: conversation, cssClassName: className
    )
    renderedDetails = TestUtils.renderIntoDocument(testedElement)
    element = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'li')
    expect(span.className).toContain(className)

#  it 'renders related users names', =>
#    testedElement = React.createElement(
#      @ConversationDetails, conversation: conversation
#    )
#    renderedDetails = TestUtils.renderIntoDocument(testedElement)
#    span = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'span')
#    console.log span