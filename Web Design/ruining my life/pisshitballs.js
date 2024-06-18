//main
function pisshitcock() {
  function CockNBalls() {
    return /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement(Cockmaster, null), /*#__PURE__*/React.createElement(Cockmaster2, null), /*#__PURE__*/React.createElement(Cockmaster3, null));
  }
  function AssNBalls() {
    return /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement(Donk, null), /*#__PURE__*/React.createElement(Cockmaster3, null));
  }
  function TitsNBalls() {
    return /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement(LeBackgrounde, null), /*#__PURE__*/React.createElement(Cockmaster3, null));
  }
  return /*#__PURE__*/React.createElement(ReactRouterDOM.HashRouter, null, /*#__PURE__*/React.createElement("div", {
    className: "cockground"
  }, /*#__PURE__*/React.createElement(ReactRouterDOM.Route, {
    path: "/",
    exact: true,
    component: CockNBalls
  }), /*#__PURE__*/React.createElement(ReactRouterDOM.Route, {
    path: "/cock",
    exact: true,
    component: CockNBalls
  }), /*#__PURE__*/React.createElement(ReactRouterDOM.Route, {
    path: "/ass",
    exact: true,
    component: AssNBalls
  }), /*#__PURE__*/React.createElement(ReactRouterDOM.Route, {
    path: "/titties",
    exact: true,
    component: TitsNBalls
  })));
}
function Cockmaster() {
  const [message, setMessage] = React.useState('cockle until u groggle');
  const toggleMessage = () => {
    setMessage(message === 'cockle until u groggle' ? 'cock' : 'cockle until u groggle');
  };
  const [count, setCount] = React.useState(0);
  const [inputValue, setInputValue] = React.useState('');
  const [text, setText] = React.useState('');
  const cockle = event => {
    setInputValue(event.target.value);
  };
  const handleClick = () => {
    setText(inputValue);
    document.title = inputValue;
    setInputValue('');
  };
  return /*#__PURE__*/React.createElement("div", {
    className: "cockmaster"
  }, /*#__PURE__*/React.createElement("div", {
    className: "penis"
  }, /*#__PURE__*/React.createElement("h1", null, "shitty react"), /*#__PURE__*/React.createElement("p", null, "Welcome to React shit edition"), /*#__PURE__*/React.createElement("p", null, "like react but more ass"), /*#__PURE__*/React.createElement("button", {
    onClick: toggleMessage
  }, "cock"), /*#__PURE__*/React.createElement("p", {
    className: "islam"
  }, message)), /*#__PURE__*/React.createElement("div", {
    className: "penis"
  }, /*#__PURE__*/React.createElement("p", null, "clickety click ", count, " "), /*#__PURE__*/React.createElement("button", {
    onClick: () => setCount(count + 1)
  }, "click for sex")), /*#__PURE__*/React.createElement("div", {
    className: "penis"
  }, /*#__PURE__*/React.createElement("input", {
    type: "text",
    value: inputValue,
    onChange: cockle,
    style: {
      marginTop: '30px'
    }
  }), /*#__PURE__*/React.createElement("button", {
    onClick: handleClick,
    style: {
      marginTop: '10px'
    }
  }, "Submit"), /*#__PURE__*/React.createElement("p", null, "Your cock: ", text), /*#__PURE__*/React.createElement("p", {
    style: {
      marginTop: '-20px'
    }
  }, "(also changes title!)")));
}
function Cockmaster2() {
  const [imageSrc, setImageSrc] = React.useState('https://i.kym-cdn.com/entries/icons/mobile/000/031/051/cover4.jpg');
  const colorMagic = () => {
    setImageSrc(imageSrc !== '/home/serna/vscoed/back end practice/next-attempt/ruining my life/bloggif_666c18f8e3dbd.gif' ? '/home/serna/vscoed/back end practice/next-attempt/ruining my life/bloggif_666c18f8e3dbd.gif' : 'https://i.kym-cdn.com/entries/icons/mobile/000/031/051/cover4.jpg');
  };
  const wavyMagic = () => {
    setImageSrc(imageSrc !== './cocknballs.gif' ? './cocknballs.gif' : 'https://i.kym-cdn.com/entries/icons/mobile/000/031/051/cover4.jpg');
  };
  const jeff = () => {
    setImageSrc(imageSrc !== './jeff.gif' ? './jeff.gif' : 'https://i.kym-cdn.com/entries/icons/mobile/000/031/051/cover4.jpg');
  };
  const [isShaking, setIsShaking] = React.useState(false);
  const toggleShake = () => {
    setIsShaking(!isShaking);
  };
  return /*#__PURE__*/React.createElement("div", {
    className: "cockmaster2"
  }, /*#__PURE__*/React.createElement("img", {
    src: imageSrc,
    onClick: toggleShake,
    className: isShaking ? 'shake' : 'cockimage'
  }), /*#__PURE__*/React.createElement("button", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '40px'
    },
    onClick: colorMagic
  }, " magic "), /*#__PURE__*/React.createElement("button", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '40px'
    },
    onClick: wavyMagic
  }, " magic 2 "), /*#__PURE__*/React.createElement("button", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '40px'
    },
    onClick: jeff
  }, " jeff "), /*#__PURE__*/React.createElement("img", {
    onClick: () => alert("FUCK FRANCE"),
    src: "https://upload.wikimedia.org/wikipedia/commons/a/a4/Animated-Flag-France.gif",
    style: {
      position: 'relative',
      marginTop: '40px',
      height: '100px'
    }
  }));
}
function Cockmaster3() {
  return /*#__PURE__*/React.createElement("div", {
    className: "cockmaster3"
  }, /*#__PURE__*/React.createElement("a", {
    href: "#/cock"
  }, /*#__PURE__*/React.createElement("h1", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '70px'
    }
  }, "COCK")), /*#__PURE__*/React.createElement("a", {
    href: "#/ass"
  }, /*#__PURE__*/React.createElement("h1", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '70px'
    }
  }, "ASS")), /*#__PURE__*/React.createElement("a", {
    href: "#/titties"
  }, /*#__PURE__*/React.createElement("h1", {
    style: {
      display: 'flex',
      position: 'relative',
      marginTop: '70px'
    }
  }, "TITTIES")));
}
function Donk() {
  const [isSpinning, setIsSpinning] = React.useState(false);
  const TheDonkThatSpins = () => {
    setIsSpinning(!isSpinning);
  };
  return /*#__PURE__*/React.createElement("div", null, /*#__PURE__*/React.createElement("h2", {
    className: "penis",
    style: {
      position: 'absolute',
      left: '305px',
      color: '#94003b'
    }
  }, "spindonk"), /*#__PURE__*/React.createElement("img", {
    src: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/359fe050-3abb-4764-b470-33c7883ce044/de8zzdt-cec9e0c0-1ef2-4574-8cb8-0e47ef45bae1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM1OWZlMDUwLTNhYmItNDc2NC1iNDcwLTMzYzc4ODNjZTA0NFwvZGU4enpkdC1jZWM5ZTBjMC0xZWYyLTQ1NzQtOGNiOC0wZTQ3ZWY0NWJhZTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.OwBltZJfOCeEabVLe1QmYNX_ID1qnee-tmO4uWJ7Yrw",
    className: isSpinning ? 'spindonk' : 'donk',
    onClick: TheDonkThatSpins
  }));
}
function LeBackgrounde() {
  const [backgroundStyle, setBackgroundStyle] = React.useState({});
  const setPiss = () => {
    setBackgroundStyle({
      backgroundImage: 'linear-gradient(44deg, #33ff11, #ff9944)',
      backgroundSize: 'cover',
      backgroundAttachment: 'fixed'
    });
  };
  const setKhalifa = () => {
    setBackgroundStyle({
      background: 'url(./khalifa.jpg) no-repeat center center fixed',
      backgroundSize: 'cover'
    });
  };
  const setKhalifaArmy = () => {
    setBackgroundStyle({
      background: 'url(./khalifa.jpg)'
    });
  };
  React.useEffect(() => {
    if (backgroundStyle.background || backgroundStyle.backgroundImage) {
      const bodyStyle = document.querySelector('body').style;
      if (backgroundStyle.background) {
        bodyStyle.background = backgroundStyle.background;
      }
      if (backgroundStyle.backgroundImage) {
        bodyStyle.backgroundImage = backgroundStyle.backgroundImage;
      }
      bodyStyle.backgroundSize = backgroundStyle.backgroundSize;
      bodyStyle.backgroundRepeat = backgroundStyle.backgroundRepeat;
      bodyStyle.backgroundAttachment = backgroundStyle.backgroundAttachment;
    }
  }, [backgroundStyle]);
  return /*#__PURE__*/React.createElement("div", {
    style: {
      position: 'absolute',
      left: '333px',
      justifyContent: 'center',
      alignItems: 'center',
      display: 'flex',
      flexDirection: 'column',
      top: '30px',
      fontSize: '31px'
    }
  }, /*#__PURE__*/React.createElement("a", {
    href: "#/titties",
    onClick: setPiss,
    style: {
      color: '#009451'
    }
  }, /*#__PURE__*/React.createElement("h3", null, "Piss")), /*#__PURE__*/React.createElement("a", {
    href: "#/titties",
    onClick: setKhalifa,
    style: {
      color: '#F38'
    }
  }, /*#__PURE__*/React.createElement("h4", {
    style: {
      paddingTop: '60px'
    }
  }, "khalifa")), /*#__PURE__*/React.createElement("a", {
    href: "#/titties",
    onClick: setKhalifaArmy,
    style: {
      color: '#F38'
    }
  }, /*#__PURE__*/React.createElement("h4", {
    style: {
      paddingTop: '60px'
    }
  }, "khalifa Army")));
}
