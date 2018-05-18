// @flow
export const FETCH_ALL_BOARDS = 'BOARD_LIST/FETCH_ALL_BOARDS'
export const LOAD_BOARDS = 'BOARD_LIST/LOAD_BOARDS'

export const fetchAllBoards = () => fetch('/api/boards', {method: 'get'})

export const loadBoards = () => dispatch =>
  fetchAllBoards().then(data =>
    dispatch({
      type: LOAD_BOARDS,
      payload: data,
    })
  )

const initialState = {
  boards: [
    {
      title: 'ZeloPet',
      id: '1',
    },
    {
      title: 'Pipefy',
      id: '2',
    },
  ],
}

const reducer = (state = initialState, {type, payload}) => {
  switch (type) {
    case LOAD_BOARDS:
      return {...state, boards: payload.data}
    default:
      return state
  }
}

export default reducer
