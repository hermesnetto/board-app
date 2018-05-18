// @flow
import * as React from 'react'
import {Anchor} from 'react-pipestyle'

type Props = {
  children: React.Node,
}

const Layout = (props: Props) => {
  return (
    <div>
      <header className="pp-header">
        <div className="pp-top-header">
          <div className="pp-left-side">
            <Anchor
              className="pp-org-name pp-no-after"
              title="Board App"
              href="#"
            >
              Board App
            </Anchor>
          </div>
        </div>
      </header>
      <main className="container">{props.children}</main>
    </div>
  )
}

export default Layout
