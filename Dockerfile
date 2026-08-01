export default {
  async fetch(request, env, ctx) {
    // 替换成你的SnapDeploy官方域名
    const target = "https://halo.containers.snapdeploy.app";
    const url = new URL(request.url);
    const targetUrl = new URL(target + url.pathname + url.search);

    const headers = new Headers(request.headers);
    headers.set("Host", new URL(target).host);
    headers.set("X-Forwarded-Proto", "https");

    const res = await fetch(targetUrl, {
      method: request.method,
      headers: headers,
      body: request.body,
      redirect: "follow"
    });
    return res;
  }
};
