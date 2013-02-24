# Boris - Unofficial Transport for London API bindings

![image](boris.jpg)

## Usage


Get the next five bus arrivals at Great Titchfield Street.

### CLI

<pre>boris 51889</pre>

![image](http://25.media.tumblr.com/6c6922df5ee92423a056246247661a8c/tumblr_mi4weuwtQP1qzqoxro1_r1_500.png)

### Ruby

<pre>
Boris::BusStop.find(51889).arrivals.take 5
</pre>

