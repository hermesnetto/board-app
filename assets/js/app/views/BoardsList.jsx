// @flow
import * as React from "react";

const BoardsList = () => {
  return (
    <div className="row" style={{ marginTop: 40 }}>
      <div className="col s4">
        <div className="card">
          <div className="card-stacked">
            <div className="card-action">
              <a href="#">ZeloPet</a>
            </div>
          </div>
        </div>
      </div>
      <div className="col s4">
        <div className="card">
          <div className="card-stacked">
            <div className="card-action">
              <a href="#">Pipefy</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default BoardsList;
