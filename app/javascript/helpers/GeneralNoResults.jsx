import React from "react";
import NoResults from "images/no-results.gif";

const GeneralNoResults = () => { 
  return (
    <div className="general-loading">
      <img src={NoResults} alt="no results icon" />
      <p>There is nothing here</p>
    </div>
  );
}

export default GeneralNoResults;