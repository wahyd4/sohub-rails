$(document).ready(function () {

    setTimeout(function () {
        window.location.reload();
    }, 1000 * 60 * 15);


    var interval = 1000 * 60;
    var nextChildToShow = 1;
    var textMessageCount = 1;
    var timeToShowNextMessage = 1000 * 5;

    var IMAGE_DELAY = 3 * 1000;
    var TEXT_DELAY = 5 * 1000;

    var timeouts = [];

    var hub_id = $('.hub').val();

    /**
     * 切换容器中的文字
     * @param container
     * @param flag 初始值
     * @param delay
     * return setInterval id
     */
    function slideDiv(container, flag, delay) {
        delay = delay || timeToShowNextMessage;
        var flag = flag || textMessageCount;
        return setInterval(function () {
            var children = container.children();
            if (flag >= children.length) {
                //reset the flag to 0
                flag = 0;
            }
            for (var j = 0; j < children.length; j++) {
                $(children[j]).hide();
            }
            for (var i = flag; i < flag + textMessageCount; i++) {
                $(children[i]).show('drop');
            }
            flag = flag + textMessageCount;
        }, delay);
    }

    function clearAllInterval(arr) {
        for (var i = 0; i < arr.length; i++) {
            clearInterval(timeouts[i]);
        }
    }

    /**
     * 循环显示不同类型的消息
     * @param interval
     * @param nextChildToShow
     */
    function cycling(interval, nextChildToShow) {
        setInterval(function () {
            var containers = $('.main-container').children();
            hideAllChildren('.main-container');
            clearAllInterval(timeouts);

            var nextContainer = containers[nextChildToShow] || containers[0];
            $(nextContainer).show('clip');
            timeouts.push(slideDiv($(nextContainer).children().last(), 1, TEXT_DELAY));

            if (nextChildToShow === containers.length) {
                nextChildToShow = 0;
            }
            nextChildToShow++;
        }, interval);
    }

    cycling(interval, nextChildToShow);

    $.get('/messages/text?hub=' + hub_id, function (json) {
    })
        .done(function (json) {
            var content = $('.text-content');
            for (var i = 0; i < json.length; i++) {
                var item = $('<li style="display: none"></li>');

                var footprint = $('<div></div>').addClass('footprint');
                footprint.append('<img src="' + json[i].user.avatar + '">');
                footprint.append('<div>' + json[i].from_user + '发表于' + timeSince(json[i].created_at) + '</div>');
                item.append(footprint);

                if (i === 0) {
                    item.css('display', 'block');
                }
                item.append('<p>' + json[i].content + '</p>');
                content.append(item);
            }
            timeouts.push(slideDiv(content, 1, TEXT_DELAY));
            $('#loading').hide();
        })
        .fail(function (error) {
            console.log('出错了！');
        });

    //delay 1 minute to display images
    setTimeout(function () {
        $.get('/messages/image', function (json) {
            var imageContainer = $('.image-content');
            for (var i = 0; i < json.length; i++) {
                var item = $('<li></li>');
                var span = $('<span><img src="' + json[i].picture_url + '"/></span>');
                item.append(span);
                imageContainer.append(item);

            }
        });
    }, interval - 1000 * 30);

    // delay almost 2.5 minute to display weibo Messages
    setTimeout(function () {
        $.get('/weibo', function (json) {
            json = json.statuses;
            console.log(json);
            var weiboContainer = $('.weibo-content');
            for (var i = 0; i < json.length; i++) {
                var item = $('<li style="display: none"></li>');

                var footprint = $('<div></div>').addClass('footprint');
                footprint.append('<img src="' + json[i].user.avatar_hd + '">');
                footprint.append('<div>' + json[i].user.name + '发布于' + timeSince(new Date(json[i].created_at)) + '</div>');
                item.append(footprint);
                var content = $('<div class="weibo"> </div>');
                if (json[i].original_pic !== undefined) {
                    content.append('<img src="' + json[i].original_pic + '"></img>');
                }
                content.append('<p>' + json[i].text + '</p>');
                if (json[i].retweeted_status !== undefined) {
                    var reweet = $('<div class="retweet"></div>');
                    reweet.append('<p>' + json[i].retweeted_status.text + '</p>')
                    if (json[i].retweeted_status.original_pic !== undefined) {
                        reweet.append('<img src="' + json[i].retweeted_status.original_pic + '"></img>');
                        content.append(reweet);
                    }
                }
                item.append(content);
                weiboContainer.append(item);

            }
        });
    }, interval * 2 - 1000 * 30);

    setTimeout(function () {
        $.get('/calendar', function (json) {
            json = json.items;
            console.log(json);
            var calendarContainer = $('.calendar-content');
            for (var i = 0; i < json.length; i++) {
                var item = $('<li style="display: none"></li>');

                var footprint = $('<div></div>').addClass('footprint');
                footprint.append('<img src="/assets/elephant.jpg">');
                footprint.append('<div> ' + json[i].creator.displayName + '发布于' + timeSince(json[i].created) + '</div>');
                item.append(footprint);
                var content = $('<div class="calendar"> </div>');
                content.append('<i class="icon-time"></i><p>从' + json[i].start.dateTime + '</p>')
                if (json[i].location !== undefined) {
                    content.append('<i class="icon-pushpin"></i><p>地点：' + json[i].location + '</p>');
                }
                content.append('<i class="icon-star"></i><p>' + json[i].summary + '</p>');
                if (json[i].description !== undefined) {
                    content.append('<p>描述：' + json[i].description + '</p>');
                }
                item.append(content);
                calendarContainer.append(item);

            }
        });
    }, interval * 3 - 1000 * 30);

});