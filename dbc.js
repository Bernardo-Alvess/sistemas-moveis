function x(d) {
    let arr = Array.from(d)
    console.log(arr)
    let newArr = []

    for (let i = 0; i < (arr.length - 1) / 2; i++) {
        newArr.push(`${arr[i]}-${arr[arr.length - 1 - i]}`)
    }

    console.log(newArr.toString().trim());
}
x('012345')