import React from "react";
import Loading from "images/loading-gif.gif";

const GeneralLoading = () => { 
  return (
    <div className="general-loading">
      <img src={Loading} alt="loading icon" />
    </div>
  );
}

export default GeneralLoading;