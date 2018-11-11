<?php

namespace App\Http\Controllers;

use App\User;
use App\Http\Controllers\Controller;
use App\Models\Channel;
use App\Models\BetType;
class TestController extends Controller
{
    private $channelList;
    private $channelListKey;
    private $arrExpert = ['dp', 'dc', '2d'];
    private $channelByDay = 
    [
        '1' => [
            'tp',
            'dt',
            'cm'
        ],
        '2' => [
            'bt',
            'vt',
            'bli'
        ],
        '3' => [
            'dn',
            'ct',
            'st'
        ],
        '4' => [
            'tn',
            'ag',
            'bth'
        ],
        '5' => [
            'vl',
            'bd',
            'tv'
        ],
        '6' => [
            'tp',
            'la',
            'bp',
            'hg'
        ],
        '7' => [
            'tg',
            'kg',
            'dl'
        ],

    ];
    private $betTypeList;
    private $betTypeListKey;

    /**
     * Show the profile for the given user.
     *
     * @param  
     * @return View
     */
    public function __construct(){
        $this->channelList = Channel::pluck('code', 'id')->toArray();
        $this->channelListKey = array_flip($this->channelList); 
        $this->betTypeList = BetType::pluck('keyword', 'id')->toArray();   
        $this->betTypeListKey = array_flip($this->betTypeList);    
    }
    public function index()
    {
        //$message = "dc . 841.915.279.xc.50n. 2d . 62.03.da10n. 723..491 x.50n 13.64 da5n. t2";
        
        //$message = "2 đài 32-23.da.10n.21.28.da5n.26.66.da1n..da 98.57.2n dav 41.76.95.39.1n.2d da 39.41.1n.69.51.1n.83.39.1n.t.1";
        //$message = "2d.dav 13.95.07.39.1n da 13.51.1n 63.51.1n 98.57.1n 22.98.1n 22.39.1n 22.95.1n 22.13.1n t.4";
       // $message = "2dai da 14.54--94.14--54.94--18.58--98.18--58.98--38.78-1n 2d.36.32.72 da2n.t5";
        //$message = "2d da 07.76.1n.22.41.1n. la.18.68.19.99.dau,100n.81.dau.100n.dui.400n.t6";
       // $message = "2d . 68 - 14 da3n . 10 - 01 da3n . t7";
        $message = "dc.79.dui.200n.2d.72.79.da1n.33.73.da10n.2d 46 64 da 5n b 10n.t6";
        //$message = "00.01.03.04.05.06.07.08.09.20.dd da300n,dp t3";
        //$message = "dc . 3312 b10n 2d 62 03 da10n . t1";
        //$message = "2d..da 14.54--94.14--54.94--18.58--98.18--58.98--20.02--58.85-1n 2d dav 07.95.41.76.1n da 22.41.1n 22.98.1n 22.76.1n 22.95.1n.t.2";
        //$message = "2d . 92 - 38 da3n . 115163.đav5n. 185807.đav5n . phu 1668 b20n. 2d . 57, 53da 8n .18.32 da2n . 15 55 95 da5n t3";
        //$message = "2d 35-53-89-98 dav10n.";
        echo "<h3>".$message."</h3>";
        $message = $this->formatMessage($message);
         var_dump($message);
        // $patternAmount = '/[a-zA-Z]*[0-9]*[n]/';
        // $patternChannel = '/[2][a-z]*/';
        // if (preg_match_all($patternChannel, $message, $matches)){
        //     dd($matches);
        // }
       
        $tmpArr = explode(" ", $message);
        $countAmount = $countChannel = $countBetType = 0;
        $amountArr = $channelArr = $betTypeArr = [];       
        foreach($tmpArr as $k => $value){
            if($this->isChannel($value)){
                $countChannel++;
                $channelArr[] = $k;
            }

        }
        // nếu tin nhắn ko có đài thì mặc định là 2 đài
        // TH chi co 1
        $betArr = [];
        //dd($channelArr);
        //echo "<br>";
        if(count($channelArr) > 0){
            foreach($channelArr as $key => $value){           
                $position =   isset($channelArr[$key+1]) ? $channelArr[$key+1] : count($tmpArr);
                
                $start = $key > 0 ? $value : 0;    
                //echo "start"."-",$start;
                //echo "<br>";
                //echo "position"."-",$position;
                //echo "<br>";       
                $betArr[] = array_slice($tmpArr, $start, $position-$start);
                
            }
        }else{

            $betArr[] = $tmpArr;
        }
        //dd($betArr);
        foreach($betArr as $arr){
            $betArrDetail[] = $this->parseBet($arr);
        }
        dd($betArrDetail);
    }

    function parseBet($arr){
       // dd($arr);
        $channel = $arr[0]; // dc, dp, 2d, vl, tp, kg...
        unset($arr[0]);
        foreach($arr as $k => $v){
            $patternAmount = '/[a-zA-Z]*[0-9]*[n]/';
       
            if (preg_match_all($patternAmount, $v, $matches)){
                $betTypeKey[] = $k;
                $betTypeArr = $matches[0];
                
            }
        }
        foreach($betTypeKey as $key => $value){           
            $position =   isset($betTypeKey[$key+1]) ? $betTypeKey[$key+1] : count($arr);
            
            $start = $key > 0 ? $value : 0;    
            //echo "start"."-",$start;
            //echo "<br>";
            //echo "position"."-",$position;
            //echo "<br>";       
            $tmp2[] = array_slice($arr, $start, $position-$start);
            
        }
        return [$channel => $tmp2];

    }
    function formatMessage($message){    

        $message = str_replace("...", " ", $message);
        $message = str_replace("..", " ", $message);
        $message = str_replace(".", " ", $message);
        $message = str_replace("---", " ", $message);
        $message = str_replace("--", " ", $message);
        $message = str_replace("-", " ", $message);
        $message = str_replace("___", " ", $message);
        $message = str_replace("__", " ", $message);
        $message = str_replace("_", " ", $message);
        $message = str_replace(",,,", " ", $message);
        $message = str_replace(",,", " ", $message);
        $message = str_replace(",", " ", $message);
        $message = str_replace("   ", " ", $message);
        $message = str_replace("  ", " ", $message);
        $message = str_replace(" ", " ", $message);
       
        $message = str_slug($message, " ");    
        $message = strtolower($message);
        $message = str_replace("2 đài", "2d", $message);
        $message = str_replace("2 dai", "2d", $message);
        $message = str_replace("2dai", "2d", $message);
        $message = str_replace("phu", "dp", $message);
        $message = str_replace("fu", "dp", $message);
        return $message;
    }
        
    function isAmount($value){
        $flag = false;
        if(strpos($value, 'n')){
            $value = str_replace("n", "", $value);
            if($value > 0){
                $flag = true;
            }
        }
        return $flag;
    }

    function isChannel($value){

        if(in_array($value, $this->channelList) || in_array($value, $this->arrExpert)){
            return true;
        }else{
            return false;
        }
    }

    function isBetType($value){        
        return in_array($value, $this->betTypeList);
    }

    function getChannel($channel = ''){
        $channelSelected = [];
        $today = date('N');
        if($channel == ''){
            $channelSelected = [$this->channelListKey[$this->channelByDay[$today][0]], $this->channelListKey[$this->channelByDay[$today][1]]];
        }elseif($channel == 'dc'){
            $channelSelected = [$this->channelListKey[$this->channelByDay[$today][0]]];
        }elseif($channel == 'dp'){
            $channelSelected = [$this->channelListKey[$this->channelByDay[$today][1]]];
        }

        return $channelSelected;
    }
}