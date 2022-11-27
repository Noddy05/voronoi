# Voronoi
Working with voronoi in processing


### Results:
Using the ```uniqueColor(int index)``` function
<br>
<br>
(In file)
```ruby
#color pixelColor = waterColor(minI, x, y);
color pixelColor = uniqueColor(minI);
#color pixelColor = distanceColor(minI, x, y, 50);
```
<p align="center"><img width="300" height="300" src="https://user-images.githubusercontent.com/111876987/204149347-94aec5c8-0ae6-46fd-b342-ac3fdadb1b5a.gif">
  <i><br>-Unique color for each point
  <br>-Random direction and speed for each point
  <br>-Bounce when hitting wall</i>
  </p>
  
<br>
<br>
<br>

Using the ```waterColor(int index, int pixel_x, int pixel_y)``` function
<br>
<br>
(In file)
```ruby
color pixelColor = waterColor(minI, x, y);
#color pixelColor = uniqueColor(minI);
#color pixelColor = distanceColor(minI, x, y, 50);
```
<p align="center"><img width="300" height="300" src="https://user-images.githubusercontent.com/111876987/204150469-73e092cc-2f58-41e3-b7b2-bc00db6930a2.gif">
  <i><br>-Color based on distance from point
  <br>-Moving points</i>
</p>
