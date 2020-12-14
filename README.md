<h2>Creating and recording GUI functional tests with Blazemeter</h2>
<p>
This description refers to all the tasks contained in a jmeter_tasks/ directory.

To record a scenario and then create a html report using jmeter, please follow steps below:
1. Install <a href="https://guide.blazemeter.com/hc/en-us/articles/206732849-Chrome-Extension-Record" rel="nofollow">Blazemeter</a> plugin to your Google Chrome browser.
2. Record with Blazemeter your real user scenario.
3. Save scenario in .jmx format
4. On your PC create an empty directory - usr/path/report/
5. Run your .jmx file with command below:</p>

<div class="highlight highlight-source-shell"><pre>
$ jmeter -n -t /path/to/your/test.jmx -l /path/where/report.csv/file/will/store -e -o /path/to/your/new/report.html
</pre></div>

<p>After that you can view your recently created html report.

Please note that directory where report.html will store should be empty.</p>