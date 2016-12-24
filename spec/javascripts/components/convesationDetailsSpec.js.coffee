#= require spec_helper

conversation = {
  id: 4,
  users_names: "ardith_volkman@example.com",
  newMessagesCount: 8
}

describe 'ConversationDetails', =>
  it 'is a react element', ->
    testedElement = React.createElement(@ConversationDetails)
    expect(TestUtils.isElement(testedElement)).toBe(true)

  it 'includes provided props.cssClassName in <li class>', =>
    className = 'testing-class-name'
    testedElement = React.createElement(
      @ConversationDetails, conversation: conversation, cssClassName: className
    )
    renderedDetails = TestUtils.renderIntoDocument(testedElement)
    li = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'li')
    expect(li.className).toContain(className)

  it 'renders related users names', =>
    testedElement = React.createElement(
      @ConversationDetails, conversation: conversation
    )
    renderedDetails = TestUtils.renderIntoDocument(testedElement)
    el = TestUtils.findRenderedDOMComponentWithClass(renderedDetails, 'conversation_users_names')
    expect(el.innerText).toEqual(conversation.users_names)

  fit 'renders newMessagesCount is there are any new Messages', =>
    testedElement = React.createElement(
      @ConversationDetails, conversation: conversation, handleCoversationSelect: -> ''
    )

    renderedDetails = TestUtils.renderIntoDocument(testedElement)

#    console.log @ConversationDetails.prototype.handleCoversationSelect()

    spyOn(renderedDetails, 'handleCoversationSelect').and.callThrough()

    li = TestUtils.findRenderedDOMComponentWithTag(renderedDetails, 'li')
    console.log(li)
    TestUtils.Simulate.click(li)

    expect(renderedDetails.handleCoversationSelect).toHaveBeenCalledWith(conversation.id)
