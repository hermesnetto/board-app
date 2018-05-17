// @flow
import * as React from 'react'

type Props = {
  children: React.Node,
}

const Layout = (props: Props) => {
  return (
    <div>
      <nav className="nav-wrapper light-blue">
        <header className="container">
          <a href="#" className="brand-logo">
            Scrum App
          </a>>
        </header>
      </nav>
      <main className="container">{props.children}</main>
    </div>
  )
}

export default Layout
