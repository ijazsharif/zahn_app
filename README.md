<h1  align="center">Z A H N</h1>
<p align="center">ZAHN is an image colorization app built using Flutter and Deepai AI to clorize old black and white photos in just in few seconds</p>

<hr>  
<h3 align="left">Requirement : </h3>
<h6 align="left"> => before runing this project make sure you provide the following requirements</h6>
<ul>
    <li>Basic understanding of <a href="https://pub.dev/packages/bloc" target="_blank"> Bloc </a> package </li>
    <li>Upgrade to Flutter 2.0 or above</li>
    <li>Create an account and get an Api Key from <a href="https://deepai.org/machine-learning-model/colorizer" target="_blank"> Deepai API </a></li>
    <li>Copy patse your api key inside <code>lib/core/util/constant.dart</code></li>
</ul>
<hr>  
<h3 align="left">Instalation :</h3>
<h6 align="left"> => run the following commands to start your project</h6>
<ul>
    <li>Step 1 : <code>flutter clean</code></li>
    <li>Step 2 : <code>flutter pub get</code></li>
    <li>Step 3 : <code>flutter run</code></li>
</ul>
<hr>
<h3 align="left">Features :</h3>
<table>
    <tr>
        <td>save files to device</td> 
        <td>select image files from gallery</td>
        <td>integrated camera view</td>
        <td>api integration</td>
    </tr>
    <tr>
        <td>responsive UI</td>
    </tr>
</table>

<hr>
<h3 align="left">Project Structure :</h3>
<small>ZAHN project uses bloc package as a state management, A predictable state management library that helps implement the BLoC <code>Business Logic Component</code> design pattern. so inside our <code>/lib</code> folder is seperated into 3 main sub-folders :
<br /><br />
<a href="https://github.com/theamiri/zahn_app/tree/main/lib/presentation" target="_blank"> Presentation Layer : </a> this layer is responsible for the application UI <code>themes, colors, screens, widgets, routes</code> it's main mission is to dispatch event mostly triggered by the user to the logic layer and adapt the ui based on states received.
<br />
<a href="https://github.com/theamiri/zahn_app/tree/main/lib/logic" target="_blank"> Logic Layer : </a> this layer play a role of man in the middle that prevent the ui from communicating directly with the data layer. instead this layer listen to event from the ui and run the function correspond inside data layer then return a state with the data required.
<br />
<a href="https://github.com/theamiri/zahn_app/tree/main/lib/data" target="_blank"> Data Layer : </a> this layer main focus is to perform network actions by getting and setting data to an external source and filter the data received to prevent malicious responses
<br /><br />
<img src="https://github.com/theamiri/zahn_app/blob/main/assets/prStructure.png" alt="project structure diagram">


</small>

 



