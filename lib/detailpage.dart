import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/getapi.dart';
import 'cartpage.dart';


class detailPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return detailPageState();
  }
}
class detailPageState extends State<detailPage>{
  late final List<Widget> items;
  String ingurl = "https://png.pngtree.com/element_pic/12/03/20/1656e3fa305853d.jpg";
  String qty = "40";
  String name = "OPC Cement";
  String price = "500";
  getitems(){
    items=[
      //img1
      Container(child:Center(child: Image.network("https://png.pngtree.com/element_pic/12/03/20/1656e3fa305853d.jpg"),) ,),
      //img2
      Container(child:Center(child: Image.network("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAN4AAADjCAMAAADdXVr2AAAAkFBMVEX///8AAAD7+/v4+Pj19fXu7u75+fnn5+fy8vLr6+vi4uLe3t7a2trU1NTs7Ozw8PDHx8fAwMDPz8+pqam6urqvr6+NjY2ioqK0tLSsrKzCwsJ/f3+WlpZZWVmKioqdnZ1ycnJqampISEhSUlJ6enpubm4pKSkxMTFPT09jY2M5OTkWFhZBQUFDQ0MbGxshISG0MdcaAAAaF0lEQVR4nO1daXuyvBI2qAVZKiIKCrhXRbv8/393SGYCEwTF1u29zjMfalXE3JnJ7Imt1j/6NWlXvv6P/tE/+kd3oP+kyungYx8fu88ayG2pfeF94yGjuD29XXf5pWn4Rw+hP2qGV1csf1xM/dLzZwpt46nu4pU2PnqvzqQTap8bcafmda/uA/8NhdpvOMzepQtejNtXWu3/BrMKqpPGC/R+21Hcgm7oXmlO6YXei1n7Wl3BycWZGJS1/3+bfAseJS90dNjmdbyx6u70Uhqmf1EhApVF8mTlPgWV8qVVSPp6sxudwCvTLxXVveiXw/mvxID27z5W1kuvpjfPkoEKxWu4Ip9HVPioljOrNL50zDZTeIxxqX3U8XhQx7SGS/lu1K1adHO/+mITUZy8bb+U+q+j3lkTX9D8EpqLivUp1BQekvZLfXQvou7v9O+3a89LLwxqfRegO4hwI03Nzl1VqX2uoguon0PLITyyGB5XNQqnNTRr3nBvPaRbkIsrcI7yayBrx/j6rIxmUqf+n6FPPSJr71HFBfPg/A2Ol/Ti4uHWrs7toIlp4zpt07swC7X0JBtppVdd7rDSC7O6tYn0X3G/r6RHKRhi9iw69fOqAXiozRnydBfX3DWqGf6bXIGP4tqg5vVZ1RssgccUlxgDLWR8lC9e1tzWqPu6m9K1scwclalb7XH1WB0XJe3qrOBL0Oaz0WV2VJfHte8f0Z5JLXjk27dk2fSmV/F5xErG7esSV4Had07CDMj9LfJ/yMI/3deqnh0Nv6Jzz5XYYGbNoGLNmJ+gYKxDUv2pzqHK7yHkXWdMH0R7GJXNwIA48nE1U6/rsHX1DTaLew1N0hnPzycO1Zidekkawumgey0fXVbDRUlvCX5r5+GJTqLp/WHxf0jFJ07A4barzYKB5mK0rrPlyZ3NQn33xqyBL7suK8SaW7GR+kKdjFaTVN5/d66N66xQt1ks07VKVu/jfPjg4uU3T87Y9dZsxAoJc9jh9AJzGIj5HexX1fMsNU4tSW929qgIcFxELSErEmNe1UB9xoSCGDImRD4oX1QLb4/fMrlPRrA+rTquDsraNkn3mIyJZxKe/3UQ95uX0XQ8dfjuAqVvfSH0uy1Z14VcEl6Z3Ahs+AerseVz9lBYknr1mTiNbYon3khc2BkMzlqtlC2U5xY7wj/vzl37JZoq2s138RG2KF5fsHJitpKmQ1UacnjnCXW4gZbxr8lPp9bChjU+6DCtcHz9WVStfSeMnQ/EEY+L37aGq9v34fDwghIvU6ZIhGad4UpcsJLJH9XAs4fAGBffdkZVV92auiUl3bcKi8/KXkirgBchvA1jgovtNn7OiWNliQ5GAD9m4PJ1B/dI+aky3a2V0JiYPQov05vCBZnstmJCepYtrN5s99ODa2vEYId60wkeV1MwVS3QC3OWeVEha45TiFkGb9g6Q8cSvIl8vjw8vaYwuOwydzebs8PcfAhT0td1mKnJJc/sJqRqt7oBvpWU4DQa5/9vyrqDkzcdVE/IB0NZtCZNVAe2TJigANqY+EAn5+rYUC0XDPZ118WsMIER6g4chyOerBnkYHas5JFkk3EufdKJwIQOGQBawcXmdfXfZmSq8+us8oGF64/85SBZFyswQgWTIKwvRGNZqDdmuy2dQ63fF3pSQz3bZVvxurd8eLloyi4Xd2aoYKL1Sgi65B5DN7tMNoPwSsLT/DvoGbV3dKEoaKM2lvR2u9wmdtbpgj/OV19KYrDf7QrzUIaXcVesKhutZKaEH9WYZClfFKrjevfyZeCywgQajO3O3ZP9iNtYNsbJa4wFjTB8bl9uV5WWUaHPKfcyeN+tE2q/lbrmt4yBypXcuydpyjeYykjqHKNRjbkyTaILMlHc4KMa4h3YxVJKRm99GJgLrtMAlscAnvkgTKism9sGS0G0UmKc0UquKK2UiTSps+UMBoLX2WszfOTMavsDH4bzI7mnkhuC9dhuBZIJBlg4NyvQaCGoBPMOHmmsTrq3ycv8OpXKzGZ/iXEh1xBmL3sEa5BpGjo7i8+duE+C5oCBtRscYDLdR9XEdE8xQyFjUp8q3MtstvAEhsNAcHEeiJwXh0dXsLZP9kL8MgVjwuOPeMP3b99arih+V/FbBjXVHwIPyDJNbtqXrCoxmHPPcSBU1qSZWCG8fu9Blea+8j2pMtiQfdCnmmHkgoZSqGVELsj/63Q6GlwlMvc5vHddf52WxxK8IWN5mYERlaHN4pgrgy4r8zJ7Ae4Q+uHrwKqhzEQs5f9SVXJ6Y2Di+wxWojUbY+sKIxNySsh55L9mwLM+PmvR95oMT1nFinkKFdO2ZlSBTWcR3j3jXl7W8n0/X4xvyLUuwpvm1m84mhAN03XBAZrvhXvaR1uJabchuOIDkGIcEdqPCdwADIV2tRwYitOZKOFcrLob+ijMw4osWuB+cTt72IrxbrcpwqPVSyfTpzBy0LkReN0GTgLC86ABu//gSH6swuNjl9OXRQuC0YPp1C1dEvEMUUb8eYAfyeAJc7ABeJ3lYnLz0SplPZNKYXdEmTacK1FaW/qSLjF7El6J3qfTqS2qLXDpsIAnnvesclnsdqTc2KdmzlOi6i1bkGcLxnCmKfeGSbrOp8RnTPVOc3hz8pHnkaZTIfxWjELElHYP97j7kS5qP1kukw7g5mj8JE2EyvDKeF+XNmr+louZ9Em5h8KMAh5faaJhyWPfx0Y1hZsQZY3Sed9WejQS6konRzr9/lxuy5gSeO8Ib4Dw+Er7Ip8yTbHCO5kx5N8a7bb8k5kN5ewfgG86ADb7oEMD8A2wQQ8KUxascRj326WoiAbMnQ19R6nt7xXp+siNtC+clrZIs0vu9TL9yQcUgBXUM3+TW7k3RM1nwYeb8OkMAd5UgTcCTyiGL41BG0Oq2ACdceVpFafUoXdQubdQfRATBt4Zx/GMiIaXsWku7IkYs4aP3OZz9EuANwH2O8slZ0ima8VnH6SAul3yRZkeh9Fvjt8LcpFJVUeYpOmapn7jEjzJPY+4Ozcn5c4xHc6RrkAlWluSBJJI9DHw7hR4Ao0pOAxuQA7v53DY3hBBc1ISZIoHocBbKPBWsNJaEp6ekQG2TYE3puBfjHSdrMB4vSdM/8rhtfqG0edBAVcICjz+YdPzvKcXgkpkUFh+QBg6GI/B8CXbHeuEw6Fse2RgI0rCKb36+Xg8zkAOvvarbA6c3dchu4t3WB0y+Z6mKVeek1nEuR0EPOtiTH83JYqloGU5m0pQRIVyRQv9MxLrwQL0FXj5dZ9fX9s38SrDC2Nh5bgTxP2YAKxmVxjIRUssbUPcR2hS+E4Mh9ZiUbyDfwRWUIaDjXHTUsxkTcTwk64dFd4ny8s+AA+TEka/DXyT8A4FvEUNvJTCs3ciotTBA7Tu2QzZ00kEMUlTwqNDwb1siXndD45miKgGp/AyK8dnh8PLWGF/bJYZIms0Elk18/7Zv3diI97H4yKsGB4ORZWIB0CCvZs0Tez18fuIMf+GoxmJlDukyCS85POTf77nejX7AW5K9CscImyZtJGLaPF1TlcWV/YW+QyTnUon8I7fPz9PNgvU6tH8pnU8FvBimkRX4X2dgfdfoZ7j6C2t1xMl7+E62evWZDQS646vq80wCIJ5S1l7U3uevTho6cvFYhG09MwnHfdbduiHjiiIcRHq3HubAhKtGRkBsRjR5y5/S2ekPs4DHuFlzXm+TwDCFJymGYbRaYOJX3Ih57rRA4vIDWMEcwIOjyVEgxvTtQjC7LFYBa7PVa9mXlUtU1IQC/J/RIp0JrUES5JB0qnIcXhFslbAw7sfUG/ykCgzcwLeRsLjmGfg0wE8U8CbiHtwNeDDtx+g6gkGOBELowtxCjgZBsxlQ/S0xbG7IcnP9By8oi4r4KGR3TeAp3BvDHV5gOclQteNYn63Dpza03+ICHeydaO3HN/3M2sc7j4PSftzvRZVOAFvm9HRzeFR4fyQ8Px0mWZYRtmyzOY+MxQdmn+7L1nEdckizMLxZMRI8KStvE6E6FxyNlFGoFFyeIPFZpPplLYjC0QPIqXVj5qlhDzxadqWkQ4dbtTlHXJ48ioOjxvC53QRXyCPmD3361OBd4577be3Nw3hQbcKCpvB6f7j/it1RfnPEd0b7jyY6615JngTgBcLHbJCeIJ8sdI2bfGkI8yhr31l6zRsueOYd9dPXb7NyDAf4Glm9E7Wtj8upNdlx8IIUkFMCl8FVGTCS8+TyUiI5kDAi0R6jLWFMzMQWANh+DbiXp/wyZbs7fEPO66/ow2XDX0kBmFe1YJFS7AujRjpWlmSVO2UkYYrRhzPlBW9HRJe/kYlvLcyvD1YlxzeCBx1MII+3P0oSvYe6IStWC0OeMzwt6HFMMl1o6jgXhneWe55bhYV7RvD+ypxLzwKeIsln3dz7hVYtDuvX4hSXZd3ZHiT0VBvjZfLNHMk2fFYufZ4AYkt1LW3/fzcTVqDaBZl0jEJR5nt6No1O+PuQg7x8t31vpizsuaUcs39GDbjrjZvcfjmzzxqovXsjYc3MNJF166zeyFty6fwZsQwADz5joDnQNzwiqcfeUTBuPtVU+5l/yxyr6WA52QhUDxodTIBtF966z3vT+F/p+6013KDYZBhDQ+rr5SX0b+5NhXIdofD4cfO4Y2EegFnMxHl3Ex1cE8tW3rhZJIZnDfHfkw3p0GSLP0Z6W5L8ziHhyfE2aqIGPBCCS8k8JYS3hwMypbJiMEWEYNwy7+5Kvag/TWcc4+37QmN3rQJQmk9oj0ftfEehcdHo4SzpXivl39ErM5z8A4UXkwDojzeM1p5vLem8R4Y5eviPYMAN2LS8/jxU8M9bg1EtB5n0foQ4SnNV1Q4UwkPzd62BI9zbye27DsLMe2+2KfadoB7zUD8nnrc3dQsU2RUg3WyN514Phf+Gh9pMs5opu1R04Dts7KYLnBb9ipJ1rOWnWmfRRYtBqJp0HN5j56m37+3jN7fJarT2u0KkzWmHTiRovgPLC9ncleGOzZHxp4ZEtGEu0u3ZBzUPGehzpVEYJ7Gxc/Uw8ucmiN7nVOALeIi6ZtNUXqPaRo3595xt9sOdyz3p0/hcerDY+a1OWEYPuRMnStIpyHZOEmiVicL//IKCTDVEDnNRFl7LRXeGuZlC0p30WoN1uk6i4C84ZBfalrWHZehQT21gB7xsC3ZiVXxjI8amCrcl1WPOyg93uSR+ZryAgJvBsZkBMZhAkIwg1t+wlqAMMvbiZ4RC5J+ZuNEmRJZ0N50V+19IFmJ3Xl44wIeWcXJz/YnG66A162BNwJ4Y/jgisKbwncG8M1gbE2w04AYd6b9zuWx6UFB8Yx0Ewjh5PS13bL3NIuKRgq8DZp0nqbNhuvYlljO34fDbgnvHnPhHAK8mB350o2SPVfUm4hLqg6Jcu2++U2l8SNOEhIGcGsHdkN773a7JiqPSIXHZ8qd1p6E+xBS9j9EamcE0XMfSp/ELocnvJJeMBQa4gTekrGqXYw3J0UtKV23Ef12pQFQqWItFXhHFZ7kj4Qn6gz8WxbgrUEnHZdTtWn+qWTb9JgrzwPFJPxFPfenBDx53ez488MXlNHH2paE5yJe2YE8CYJnZnqVHUOMUdfjgM3CYl9RR0N4ejSbUTkIoxk/EWNZgueiLdmCLzCDLQDTNOWSYY0mouzV+XNLHBC1E70FeSL3egIdSVQklh22goAKtEU+yEbps0JfbFYQOpSfFzGZBJ1COCW8A3hyMeTbJtAGOwQxGDMxlBl8KW4WAFN1MedNudKmzqdOD6Xqf9OmP5V7iyTBN7lhltlACU/ERgauwuJDZqZ7gswCetvDLoAZ2wskAsoQCpgqvA18KWxJ02B0DihvGDeeJvHnpZxrgyVTttFWwZuU4Z00V8tbig6YXo+P0TCFZ9J5QFrNsKmLr7TpcOOA8Nq8NoL2WZDNMqVinYOXOa/WoyygIsNDypJQYdBRgZcyeULLmBUxH1eleSVCCmdOObwEbIZQSH8HcJ6UIEzp2XMiuiJnEQ68zcf0rps48pjA40Yu9wY63GSI/8zQDz0Cb4kfmaEh8aaD1zlFPVUPRBqfwuv4GZFLuJhmOsiK5/MY7yA+MkZ4B7CA3Y/F2SM1bkcdJdu6UrYifqg7TcLlIpXPUThlW64HjrPs/8tptl9/8TtK7q0g3NBx/SYQfLgfYta6v/6JNCUbqGyNHSka7qBk0merT1Rrc9ygkJE2CjP5cwcDvju5Ch4s3PkwIBHWdByPud3eQfBj4iSkAC+AYCwEq4BH/kCDEOYAWzCtjXw7RZW9Kcg16Ttk0Tl9PWD5LoAOI5q1DG+aYPsgbxOnWxpU0nRd3L4HR+X3bbG68cwD3JOG1hyHd2OfNVJcGM49Odg2sQyt3jpNufE92VXD4YlQ18octedok55yMMtOGd4sz7a/8b2w70VFRHKPd3Pml3d4p4f4T3dd1yLc4x6ZiEGmrnsHA656qkrOSjF9rbGyI0V35JTPyB4i7nZo/sDnuDi/KkRmiF5NtkIFqhyeNJRG/7lZQstVQsNxsQPMoxIo4cWB2F6kxfOYX8dNA61kcL96gNcLQ7licvPoc87H2KhnP8THPPnsVMEDSydklj8Oc3iZqed6QTqvkntrvAdGyuEBLKB3y3Kgpcjsp7IRbJbn3stnRijcS9NlgsPmSl4uyUGSJgGOny3Ih3E/e2uC1RqENwfbYKCfjsdXhLA0mlcj1BM/1Apiryaiiktufxs6bnSfbkUvca9F34Ah97rv9bFqF85b0kLQTBNQVwE8C0D5IWP/7LU6I9X+F/DmJCwaMHqcjmVZQiPmTXJa3+ij1C7EC+z8iVD3JFetbjLllCl7lOvMengnxJUJVzK+8K5bAp7QnXYc3+MQK5XU/gV1Xr1h3TG5MSsOrvQR3ma7Vfy7THS5zuemQEkZSe6FOEWa5z37p/fC8lEyyvkX8GSJ6fjVYSe0H4MpcJm6mbjl2HDkKO4q5dsVBReN8HGJM0s9z8Qvil/zVeE8jtf7wiimWN/8wWEz4A4/NwJEJP0+0rjH9H08nwzgWbi0p8t7nIeoLvf6ozkjoj+XtEbrhqDujlgzYqx08mrCqk87w+PY9DWo2jnmig+w0s3ftv+ok1R3rIHpqV7TfFUUiNKq3qNY7GQTOlT95F7iDWfRGU+sjWUNMBEtG8AaODOYVbhZ5DA7UyLvQp568FU+tl8hXjvixsJx8QSkk1NXH0leadl95AyKVsVb1OEP1WRamSS8nGTY3y4f9nUfUgXMqTW6K1JdpwtrhB7K7AgWzXRAN6LsnsAzbUdIVVs2W0zHt7WAzWS2/NuBIbHDtJGg58KmtQgtWooOJMLrjMIRWDY3HtO4QEtTWPER3qw3fWQdcH5mZ5ppnnqmePwKV6jQKcVUt4d7A5Whuh9BmS3EXJV7n8RZ6cD2TuG0LFfV83qkP5bRAe+yNU7WDn2eUw6va1eeQd/BOmqA3vgeBmDUOU8XqekhYSTtrBzlr3QL1NMCNiUZsiI4v3T+NhCilQfUowq/gQtnl7ZVm4WRVOAlazHubhieneFyCSWQBafp5P5udQWN6g2Z1jtNG3hylZVSj2G0kd09yuvmwIcL10zJ6dyN3FqdFVUfQ9wnmTEOT7A7QIs2/DoI4YvkSaryfNyeelRf5qghvPXffrLp95QUBi4gjQQDypAscBcwhggvxs7VqHzUqF93fMQRna7Kn767Jdn1DtOYOGiVA/Ui8CYlPO2tJBThpdMxluj7nvwa6K1Ivy7xOJw0il9GQ8F4DVuEL/7mi4ykkal/8J3rubVvMIUXzoOX9FPKLF38SRuVZHrrpsnQoGDkhpycFCTEY8Egru1W71LXp6CBjiV4fXkymrN9WJB+prixJpP9QY5Kl6ZANs934bi8Vg/rmEPsgGl32uoHJLmS+3eoR/9OpKt+vENHeC4+SsU6KR9abVUd88wpvfBbaDelBtbWDiq4XYZ3QpZsaCqTrKVMr/pxsF8S4euYqMaQIAqa/YqNJN0uqeRJ9WqV9e/uLcOGM8tuRuDR4zadOf5UQrMgLS2r2DP1WkrysJgbdZmdJbtCMzPWSF0vWSlblW9lHzUy4XLB/zXivbYCIOH51c6/c8lrbjeznHeguh/12FS9gfX3dgICrGN7gXUoL9GvEhsNXOjvd7GAZ6yDEhSQ19Oq+cbWDgO3hem0Y16hbc1vVxgyWfCMX+pubCP1xqMzaiz5nYT12rb6+bnK1ymNy4mk44VVeb9I3qi5dZ9mm/z0KjU2+SypSLOhhyyd/ht26xAzMyP2N6xyRsZVv7RQUOdiOfZ1jgepmkHZEhMjDB1t1AbmpZ2URSEuSakuhfxeOwBucl9ZMsgf67i6rFtVD7CAjaJ1di7x9/djUx+UHqRrQvlJxN9VsNzyT1JEF9jVfVzRoardxb0qaGjZZUvQ1EY+aVeO36xAp60ulZBHjyhoNpmkXpUpn9UIGR5pr32WF5NXkjr90VvgqCxSVVHZzSb7O1NMEM0wG/tdZ/HiOql8Rs2hse+F9f7W6HUa+H9JvzNRevmXsryaRffsLX6/O32zWy6VdB6Ow6j5v1UVpzU9czq+JOD6I5IpZbrowrgNveFNGV75+cN151U0R5UnvWN51vJHnUGrjSKeDfOsUpFpr+BeFax70A3H2ilbNr1uVd5X6bRr/s+//Xd+VKfsnz3m5NGrqX1lnfgpPRB/p27Dcu7F4OLpurNTNQBZmDNqhKz2B54f9yvkZ6jxlEpTMEVXwH82M35Nfyxxl6OFV5uHP2bJyx9/hjtWosqdN1eq9Nfi0sXBt6+09heb2l/TAtbpTEm1s/Ds7ScndFa+JAy5tl5C89+eLjPlNaXwZvQCuvIsvdyqeQn6ddP3c0hraMpqL/tvLMK64b+WIf8zSTj/90vzvyGV/0ilf1z7R//oH/2jf/QI+h9RQFB8kvXUNAAAAABJRU5ErkJggg=="),) ,),
    ];
  }
  int _current = 0;
  @override
  void initState(){
    //TODO: implement initState
    super.initState();
    getitems();
    GetApi.getnewsdata();
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                //slider

                Container(
                  width: size.width,
                  height: size.height/2,
                  color: Colors.grey,
                  child: CarouselSlider(
                      items: items,
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                        onPageChanged: (index, reason){
                          setState(() {
                            _current = index;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                      )
                  ),
                ),
                //Container
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: size.height/2.0,
                    decoration: BoxDecoration(
                        color: Color(0xff404042),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30)
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // text
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("OPC Premium",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.bold,fontSize: 16,),),
                                    SizedBox(height:15),
                                    Text("RS. 1080/- per Bag",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal,fontSize: 14,),),
                                    SizedBox(height:15),
                                    Text("Minimum Bags: 500.",style:
                                    TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.normal,fontSize: 12,),)
                                  ],
                                ),
                                //buttons
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          //minus button
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(50),

                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Center(child: Text("-",style: TextStyle(fontSize: 20,color: Colors.white),)),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("41",style: TextStyle(fontSize: 14,color: Colors.white),),
                                          ),
                                          //plus
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius: BorderRadius.circular(50),

                                            ),
                                            padding: EdgeInsets.all(10),
                                            child: Center(child: Text("+",style: TextStyle(fontSize: 20,color: Colors.white),)),
                                          ),
                                        ],
                                      ),
                                      Container(
                                          padding: EdgeInsets.only(left:20.0,right:20,top:10,bottom:10),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.orange
                                          ),
                                          child: Text("Bags",style: TextStyle(color: Colors.white),)
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),

                          Container(
                            width: size.width/1.1,
                            child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec id ex libero. Praesent ultricies ipsum sit amet sapien porta, et vehicula sapien vulputate. Aliquam aliquet purus et justo bibendum, sit amet faucibus velit egestas. Duis fringilla arcu in lorem placerat, ac pharetra lacus finibus. Nulla ut nulla et ligula aliquam facilisis ac eget purus. Phasellus elementum dui vel libero eleifend bibendum. Proin sed nisl id enim ullamcorper lacinia.",
                              style: TextStyle(color: Colors.white,fontSize: 11,fontWeight: FontWeight.normal), ),
                          ),

                          //add to cart
                          GestureDetector(
                            onTap: () async {
                              //add to cart storage
                              final SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs.setString("ingurl", ingurl);
                              prefs.setString("title", name);
                              prefs.setString("Qty", qty);
                              prefs.setString("price", price);
                              //navigate
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context)=>
                                  CartPage())
                              );
                            },
                            child: Container(
                                height: 70,
                                margin: EdgeInsets.only(top: 10),
                                width: size.width,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),

                                ),   child: Center(
                              child: const Text(
                                "Add to Cart"
                                ,style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,fontSize: 14),),
                            )
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }



}