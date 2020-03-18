import readline from 'readline'

function range(start, stop) {
    return [...Array(stop).keys()].map(i => i + start);
}

async function main() {
    const rl = readline.createInterface(process.stdin, process.stdout);

    const input = await new Promise(res => rl.once('line', res));
    const n = Number(input);
    let l = range(1, n).map(i => i % 6 + 1);
    l = range(1, 6).map(i => l.filter(j => i == j).length);
    console.log(l.every(i => i === l[0]) ? 'Yes' : 'No')
}

main()