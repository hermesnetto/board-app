// @flow
import * as React from 'react'
import {Dashboard, SimpleBox} from 'react-pipestyle'

type Props = {
  boards: Array<{title: string, id: string}>,
  loadBoards: () => void,
}

class BoardList extends React.Component<Props> {
  componentDidMount() {
    this.props.loadBoards()
  }

  render() {
    const {boards} = this.props

    return (
      <Dashboard count={13} icon="pp-ico-pipes" title="My Boards">
        {boards.map(({title, id}) => (
          <SimpleBox tabIndex={0} href="#" title="d" value={title} key={id} />
        ))}
      </Dashboard>
    )
  }
}

export default BoardList
