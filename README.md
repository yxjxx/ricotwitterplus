# Twitter+: ads free twitter on non-jailbreak devices.

1. Decrypt ipa using frida.
2. Make dylib using theos.
3. Inject dylib using Azule.
4. You can install the TwitterPlus.ipa with Altstore on non-jailbreak devices.

```bash
# frida 
iproxy 2222 22
python3 ./dump.py --password <password> com.atebits.Tweetie2
# theos
make package
# Azule
azule -i Twitter.ipa -o ./ -n TwitterPlus -p Twitter+ -b com.yxjxx.twitter -f ./com.yourcompany.ricotwitterplus_0.0.1-2+debug_iphoneos-arm.deb -v -e -w
```

Refer: https://github.com/haoict/twitter-no-ads