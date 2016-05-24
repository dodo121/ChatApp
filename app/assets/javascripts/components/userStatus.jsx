var UserStatus = React.createClass({
  getInitialState: function() {
    return {statuses: this.props.statuses};
  },

  handleStatusChange: function() {

  },

  render: function() {
    var RB = ReactBootstrap;
    var statuses = this.props.statuses;
    return (
      <RB.DropdownButton title="Status" id="bg-nested-dropdown">
        {Object.keys(statuses).map(function(status, index) {
          return <RB.MenuItem key={index} onClick=handleStatusChange()>{statuses[status]}</RB.MenuItem>;
        })}
      </RB.DropdownButton>
    );
  }
});