// @flow
import {combineReducers} from 'redux'
import {reducer as boardsListReducer} from './modules/BoardsList'

export default combineReducers({
  boardsList: boardsListReducer,
})
