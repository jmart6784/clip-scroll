import React, { useEffect, useState } from "react";

const PlaylistVideoMenu = () => { 
  const [prompt, setPrompt] = useState(false);

  let menuJsx = <button type="button" onClick={() => setPrompt(true)}>Prompt</button>;

  if (prompt) {
    menuJsx = (
      <div>
        <button type="button" onClick={() => setPrompt(false)}>Close</button>
      </div>
    );
  }

  return menuJsx;
}

export default PlaylistVideoMenu;