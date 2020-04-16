import tape from "tape";

tape('timing test', function (t) {
    t.plan(1);
    t.equal(typeof Date.now, 'function');
});
