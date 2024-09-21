I answered by using bitwise and binary string operator allows to enable/disable/store feature at ease.

Settings are saved in `.bin` to secure the file.  Using binary format comes with fast retrival and storing of data than normal text file.

Results are the following:

```c#
string settings = "00000000"; // initialize settings.
settings = SetFeature(settings, 7, true); // add voucher as one of the enabled feature
settings = SetFeature(settings, 4, true); // add camera as one of the enabled feature
SaveSettingsToFile(settings, "userSettings.bin"); // save file as .bin

string loadedSettings = LoadSettingsFromFile("userSettings.bin"); // load binary file.
Console.WriteLine(IsFeatureEnabled(loadedSettings, 7)); // check settings if user has voucher enabled; Output: true
Console.WriteLine(IsFeatureEnabled(loadedSettings, 4)); // check settings if user has camera enabled; Output: true
Console.WriteLine(IsFeatureEnabled(loadedSettings, 1)); // check settings if user has sms notification enabled; Output: false
Console.WriteLine(loadedSettings); // output the settings; Output: "00010010"
```
