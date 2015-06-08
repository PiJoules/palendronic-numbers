<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
    <head>
        <title>Making numbers palindromic</title>

        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="/static/css/docs.min.css" />
        <link type="text/css" rel="stylesheet" href="/static/css/main.css"/>
    </head>

    <body id="top">
        <a href="https://github.com/PiJoules/palendronic-numbers"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://camo.githubusercontent.com/365986a132ccd6a44c23a9169022c0b5c890c387/68747470733a2f2f73332e616d617a6f6e6177732e636f6d2f6769746875622f726962626f6e732f666f726b6d655f72696768745f7265645f6161303030302e706e67" alt="Fork me on GitHub" data-canonical-src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png"></a>


        <div class="container bs-docs-container">
            <div class="row">
                <div class="col-md-9">
                    <div class="bs-docs-section">
                        <div id="overview" class="page-header">
                            <h1>Validating Sorting Networks</h1>
                        </div>
                        <p class="lead">
                            Describe how many steps it took to get it to be palindromic, and what the resulting palindrome is. More information about the challenge at <a target="_blank" href="https://www.reddit.com/r/dailyprogrammer/comments/38yy9s/20150608_challenge_218_easy_making_numbers/">/r/dailyprogrammer</a>.
                        </p>

                        <form class="palindromic-numbers-form" method="GET" action="/check">
                            <div class="row">
                                <div class="col-lg-4">
                                    <div class="form-group">
                                        <label># to check: </label>
                                        <input class="form-control" type="text" name="num" value="" placeholder="num" />
                                    </div>
                                </div>
                            </div>

                            <p><button type="submit" class="btn btn-default">Check</button></p>

                            <p class="result"></p>
                        </form>
                    </div>
                    <div class="bs-docs-section">
                        <div class="page-header">
                            <h2 id="examples">Examples</h2>
                        </div>
                        <p class="lead">
                            Some examples (in case I didn't exmplain how to use this well).
                        </p>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 id="example-valid-network" class="panel-title">Example input of a valid network</h3>
                            </div>
                            <div class="panel-body">
                                <form class="palindromic-numbers-form" method="GET" action="/check">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label># to check: </label>
                                                <input class="form-control" type="text" name="num" value="11" placeholder="num" />
                                            </div>
                                        </div>
                                    </div>

                                    <p><button type="submit" class="btn btn-default">Check</button></p>

                                    <p class="result"></p>
                                </form>
                            </div>
                        </div>


                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 id="example-invalid-network" class="panel-title">Example input of an invalid network</h3>
                            </div>
                            <div class="panel-body">
                                <form class="palindromic-numbers-form" method="GET" action="/check">
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="form-group">
                                                <label># to check: </label>
                                                <input class="form-control" type="text" name="num" value="68" placeholder="num" />
                                            </div>
                                        </div>
                                    </div>

                                    <p><button type="submit" class="btn btn-default">Check</button></p>

                                    <p class="result"></p>
                                </form>
                            </div>
                        </div>

                    </div>

                    <div class="bs-docs-section">
                        <div class="page-header">
                            <h2 id="source">Source</h2>
                        </div>
                        <p class="lead">
                            This is the main class that takes the number of wires and lines connecting them, and determines whether or not the network is valid. The rest of the code is available on <a href="https://github.com/PiJoules/palendronic-numbers">Github</a>.
                        </p>

                        <pre>
package com.dailyprogrammer.PalindromicNumbers;

import java.math.BigInteger;
import java.util.Scanner;

public class PalindromicNumberChecker {
&#x9;private BigInteger num;

    /**
     * Retrieve the number of steps required to make a palendrom of the number
     * @param  n string
     * @return   BigInt
     */
    public long getStepCount(String n){
    &#x9;BigInteger num = new BigInteger(n);
    &#x9;BigInteger revNum = reverseNum(num);
    &#x9;long steps = 0;

    &#x9;while (!num.equals(revNum)){
    &#x9;&#x9;num = num.add(revNum);
    &#x9;&#x9;revNum = reverseNum(num);
    &#x9;&#x9;steps++;
    &#x9;}

    &#x9;this.num = num;
    &#x9;return steps;
    }

    /**
     * Get the flipped value of the number
     * @param  num BigInt
     * @return     BigInt
     */
    private static BigInteger reverseNum(BigInteger num) {
        String reverseStr = new StringBuilder(num.toString()).reverse().toString();
        return new BigInteger(reverseStr);
    }

    /**
     * Getter for the final palindrome number
     * @return NigInt
     */
    public BigInteger getPalindromeNum(){
    &#x9;return this.num;
    }
}
                        </pre>
                    </div>
                </div>

                <div class="col-md-3">
                    <nav class="bs-docs-sidebar hidden-print hidden-xs hidden-sm affix" style="position: fixed;">
                        <ul class="nav bs-docs-sidenav">
                            <li class="">
                                <a href="#overview">Validating Sorting Networks</a>
                            </li>
                            <li>
                                <a href="#examples">Examples</a>
                                <ul class="nav">
                                    <li><a href="#example-valid-network">Valid Network</a></li>
                                    <li><a href="#example-invalid-network">Invalid Network</a></li>
                                </ul>
                            </li>
                            <li class="">
                                <a href="#source">Source</a>
                            </li>
                        </ul>
                        <a class="back-to-top" href="#top">Back to top</a>
                    </nav>
                </div>
            </div>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="/static/js/docs.min.js"></script>
        <script type="text/javascript">
            $('.palindromic-numbers-form').each(function(){
                var that = $(this);
                that.on('submit', function(e) {
                    var num = that.find("input[name=num]").val().trim();
                    if (num !== ""){
                        $.ajax({
                            url: that.attr('action'),
                            type: that.attr('method'),
                            data: that.serialize(),
                            success: function(response) {
                                response = JSON.parse(response);
                                createValidMessage(that.find(".result"), num + " gets palindromic after " + response[0] + " steps: " + response[1]);
                            }
                        });
                    }
                    else {
                        createMissingMessage(that.find(".result"));
                    }
                    e.preventDefault();
                });
            });

            function createValidMessage(elem, content){
                elem.html('<div class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a>' + content + '</div>');
            }

            function createMissingMessage(elem){
                elem.html('<div class="alert alert-warning"><a href="#" class="close" data-dismiss="alert">&times;</a>The input given is not valid.</div>');
            }
        </script>
    </body>
</html>