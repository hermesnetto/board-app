// @flow
import {connect} from 'react-redux'
import BoardList from './Component'
import {loadBoards} from './redux'

const mapState = state => ({
  boards: state.boardsList.boards,
})

const mapDispatch = dispatch => ({
  loadBoards: () => loadBoards(),
})

export default connect(mapState, mapDispatch)(BoardList)
