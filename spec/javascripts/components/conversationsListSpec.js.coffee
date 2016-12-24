#= require application
#= require components

TestUtils = React.addons.TestUtils

conversations = [
  { id: 4, users_names: ["ardith_volkman@example.com"], newMessagesCount: 8 }
]

[testedElement, renderedElement] = ['', '']

describe 'conversationsList', =>
  beforeEach =>
    testedElement = React.createElement(@ConversationsList, conversations: conversations)

  it 'is a react element', ->
    expect(TestUtils.isElement(testedElement)).toBe(true)

  it 'is rendered with <ul> tag with .conversations-list className', ->
    renderedList = TestUtils.renderIntoDocument(testedElement)
    ul = TestUtils.findRenderedDOMComponentWithTag(renderedList, 'ul')
    expect(ul.className).toEqual('conversations-list')

  it 'renders one <li> element for one conversation', ->
    renderedElement = TestUtils.renderIntoDocument(testedElement)
    lis = TestUtils.scryRenderedDOMComponentsWithTag(renderedElement, 'li')
    expect(lis.length).toEqual(1)

  it "renders two <li>'s for two conversations", =>
    conversations.push({ id: 2, users_names: ["ziomek2@example.com"], newMessagesCount: 2 })
    testedElement = React.createElement(@ConversationsList, conversations: conversations)
    renderedElement = TestUtils.renderIntoDocument(testedElement)
    lis = TestUtils.scryRenderedDOMComponentsWithTag(renderedElement, 'li')
    expect(lis.length).toEqual(2)
