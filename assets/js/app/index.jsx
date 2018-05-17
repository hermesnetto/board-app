// @flow
import * as React from "react";
import * as ReactDOM from "react-dom";
import Layout from "./modules/Layout";
import BoardsList from "./views/BoardsList";

ReactDOM.render(
  <Layout>
    <BoardsList />
  </Layout>,
  ((document.querySelector("#app-root"): any): HTMLElement)
);
