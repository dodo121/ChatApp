#= require spec_helper

conversation = {
  id: 4,
  users_names: "ardith_volkman@example.com",
  newMessagesCount: 8
}

component = @ConversationDetails

describe 'ConversationDetails', ->
  it 'is a react element', ->
    testedElement = React.createElement(component)
    expect(TestUtils.isElement(testedElement)).toBe(true)

  it 'includes provided props.cssClassName in <li class>', ->
    className = 'testing-class-name'
    testedElement = React.createElement(
      component, conversation: conversation, cssClassName: className
    )
    renderedDetails = TestUtils.renderIntoDocument(testedElement)
    li = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'li')
    expect(li.className).toContain(className)

  it 'renders related users names', ->
    testedElement = React.createElement(
      component, conversation: conversation
    )
    renderedDetails = TestUtils.renderIntoDocument(testedElement)
    el = TestUtils.findRenderedDOMComponentWithClass(renderedDetails, 'conversation_users_names')
    expect(el.innerText).toEqual(conversation.users_names)


#  it 'renders newMessagesCount is there are any new Messages', ->
#    testedElement = React.createElement(
#      component, conversation: conversation
#    )
#    renderedDetails = TestUtils.renderIntoDocument(testedElement)
#    v = spyOn(renderedDetails, 'handleCoversationSelect')
#    console.log('renderedDetails', renderedDetails)
#    li = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'li')
#