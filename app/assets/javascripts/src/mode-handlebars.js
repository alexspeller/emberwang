define('ace/mode/handlebars_highlight_rules', function(require, exports, module) {
    "use strict";

    var oop = require("../lib/oop");
    var TextHighlightRules = require("ace/mode/text_highlight_rules").TextHighlightRules;
    var HtmlHighlightRules = require("ace/mode/html_highlight_rules").HtmlHighlightRules;

    var HandlebarsHighlightRules = function() {
        this.$rules = {
        "start" : [
            {
                token: "support.function",
                regex: "[\\w-_]+",
                next: "arguments"
            }],
        "arguments": [
            {
                token: "text",
                regex: "[^\\}]+",
                next: "start"
            }
        ]
    };

    }
    oop.inherits(HandlebarsHighlightRules, TextHighlightRules);

    var HtmlHandlebarsHighlightRules = function() {

        this.$rules = new HtmlHighlightRules().getRules();

        this.$rules["handlebars-comment"] = [
            {token : "comment.block", regex : "\\}\\}", next : "start"},
            {defaultToken : "comment.block"}
        ];

         for (var i in this.$rules) {

            this.$rules[i].unshift({
                token: "string.other",
                regex: "\\{\\{",
                next: "handlebars-start"
            });

            this.$rules[i].unshift({
                token: "comment.block",
                regex: "\\{\\{!",
                next: "handlebars-comment"
            });



        }
        this.embedRules(HandlebarsHighlightRules , "handlebars-", [
            {
                token: "string.other",
                regex: "\\}\\}",
                next: "start"
            }
        ]);
    };


    oop.inherits(HtmlHandlebarsHighlightRules, HtmlHighlightRules);

    exports.HtmlHandlebarsHighlightRules = HtmlHandlebarsHighlightRules;
});


define('ace/mode/handlebars', function(require, exports, module) {

var oop = require("ace/lib/oop");
var TextMode = require("ace/mode/text").Mode;
var Tokenizer = require("ace/tokenizer").Tokenizer;
var HtmlHandlebarsHighlightRules = require("ace/mode/handlebars_highlight_rules").HtmlHandlebarsHighlightRules;

var Mode = function() {
    this.$tokenizer = new Tokenizer(new HtmlHandlebarsHighlightRules().getRules());
};
oop.inherits(Mode, TextMode);

(function() {
    // Extra logic goes here. (see below)
}).call(Mode.prototype);

exports.Mode = Mode;
});
