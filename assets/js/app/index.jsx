// @flow
import * as React from 'react'
import * as ReactDOM from 'react-dom'
import {createStore, applyMiddleware} from 'redux'
import {Provider} from 'react-redux'
import thunk from 'redux-thunk'
import Layout from './modules/Layout'
import BoardsList from './modules/BoardsList'
import rootReducer from './rootReducer'

const devTools =
  window.__REDUX_DEVTOOLS_EXTENSION__ && window.__REDUX_DEVTOOLS_EXTENSION__()

const store = applyMiddleware(thunk)(createStore)(rootReducer, devTools)

ReactDOM.render(
  <Provider store={store}>
    <Layout>
      <BoardsList />
    </Layout>
  </Provider>,
  ((document.querySelector('#app-root'): any): HTMLElement)
)
