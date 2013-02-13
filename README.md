# Boris - Unofficial Transport for London API bindings

![image](boris.jpg)

<pre>gem install boris</pre>

## Usage

Get the next five bus arrivals at Great Titchfield Street.

<pre>
Boris::BusStop.find(51889).arrivals.take 5
</pre>

