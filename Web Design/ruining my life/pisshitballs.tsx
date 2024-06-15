declare var React : any;
declare var ReactRouterDOM : any;

//main
function pisshitcock() {
    function CockNBalls() {
        return (
            <div>
                <Cockmaster />
                <Cockmaster2 />
                <Cockmaster3 />
            </div>
        );
    }

    function AssNBalls() {
        return(
            <div>
                <Donk />
                <Cockmaster3 />
            </div>
        );
    }

    function TitsNBalls() {
        return(
            <div>
                <LeBackgrounde/>
                <Cockmaster3 />
            </div>
        );
    }

    return(
            <ReactRouterDOM.HashRouter>
                <div className="cockground">
                    <ReactRouterDOM.Route path="/" exact component={CockNBalls} />
                    <ReactRouterDOM.Route path="/cock" exact component={CockNBalls} />
                    <ReactRouterDOM.Route path="/ass" exact component={AssNBalls} />
                    <ReactRouterDOM.Route path="/titties" exact component={TitsNBalls} />
                </div>    
            </ReactRouterDOM.HashRouter>
    );
}

function Cockmaster() {
    const [message, setMessage] = React.useState('cockle until u groggle');

    const toggleMessage = () => {setMessage(message === 'cockle until u groggle' ? 'asujdhasjfhaf' : 'cockle until u groggle');};

    const [count, setCount] = React.useState(0);

    const [inputValue, setInputValue] = React.useState('');
    const [text, setText] = React.useState('');

    const cockle = (event : any) => {setInputValue(event.target.value);};

    const handleClick = () => {
        setText(inputValue);
        document.title = inputValue;
        setInputValue('');
    };

    return(
            <div className="cockmaster">
            <div className="penis">
                <h1>shitty react</h1> 
                <p>Welcome to React shit edition</p>
                <p>like react but more ass</p>
                <button onClick={toggleMessage}>cock</button>
                <p className="islam">{message}</p>
            </div>

            <div className="penis">
                <p>clickety click {count} </p>
                <button onClick={() => setCount(count + 1)}>click for sex</button>
            </div>
            <div className="penis">
                <input type="text" value={inputValue} onChange={cockle} style={{ marginTop: '30px' }}  />
                <button onClick={handleClick} style={{ marginTop: '10px' }} >Submit</button>
                <p>Your cock: {text}</p>
                <p
                style={{ marginTop: '-20px' }}
                >(also changes title!)</p>
            </div>
        </div>
    );
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

    return (
        <div className="cockmaster2">
            <img src= {imageSrc} onClick= {toggleShake} className={isShaking ? 'shake' : 'cockimage'}>
            </img>
            <button style= {{ display: 'flex', position: 'relative', marginTop: '40px' }} onClick = {colorMagic}> magic </button>
            <button style= {{ display: 'flex', position: 'relative', marginTop: '40px' }} onClick = {wavyMagic}> magic 2 </button>
            <button style= {{ display: 'flex', position: 'relative', marginTop: '40px' }} onClick = {jeff}> jeff </button>

            <img onClick={() => alert("FUCK FRANCE")} src='https://upload.wikimedia.org/wikipedia/commons/a/a4/Animated-Flag-France.gif' style={{ position: 'relative', marginTop: '40px', height: '100px' }} />
        </div>
    );
}

function Cockmaster3() {
    return(
        <div className="cockmaster3">
            <a href='#/cock'>
                <h1 style= {{ display: 'flex', position: 'relative', marginTop: '70px' }} >COCK</h1>
            </a>
            <a href='#/ass'>
                <h1 style= {{ display: 'flex', position: 'relative', marginTop: '70px' }} >ASS</h1>
            </a>
            <a href='#/titties'>
                <h1 style= {{ display: 'flex', position: 'relative', marginTop: '70px' }} >TITTIES</h1>
            </a>
        </div>
    );
}

function Donk() {
    const [isSpinning, setIsSpinning] = React.useState(false);
    const TheDonkThatSpins = () => {
        setIsSpinning(!isSpinning);
    };
    return(
        <div>
            <h2 className="penis" style= {{position: 'absolute', left: '305px', color:'#94003b'}}>spindonk</h2>
            <img src='https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/359fe050-3abb-4764-b470-33c7883ce044/de8zzdt-cec9e0c0-1ef2-4574-8cb8-0e47ef45bae1.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzM1OWZlMDUwLTNhYmItNDc2NC1iNDcwLTMzYzc4ODNjZTA0NFwvZGU4enpkdC1jZWM5ZTBjMC0xZWYyLTQ1NzQtOGNiOC0wZTQ3ZWY0NWJhZTEucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.OwBltZJfOCeEabVLe1QmYNX_ID1qnee-tmO4uWJ7Yrw' className={isSpinning? 'spindonk' : 'donk'} onClick = {TheDonkThatSpins}/>
        </div>
    );
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
      background: 'url(./khalifa.jpg)',
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

    return(
        <div style={{position: 'absolute', left: '333px', justifyContent:'center', alignItems:'center', display:'flex',flexDirection:'column', top:'30px',fontSize:'31px'}}>
            <a href='#/titties' onClick={setPiss} style={{color:'#009451'}}>
                <h3>Piss</h3>
            </a>
            <a href='#/titties' onClick={setKhalifa} style={{color:'#F38'}}>
                <h4 style={{paddingTop:'60px'}}>khalifa</h4>
            </a>
            <a href='#/titties' onClick={setKhalifaArmy} style={{color:'#F38'}}>
                <h4 style={{paddingTop:'60px'}}>khalifa Army</h4>
            </a>
        </div>
    );
}
